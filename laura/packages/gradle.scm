(define-module (laura packages gradle)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages java)
  #:use-module (gnu packages java-xml)
  #:use-module (gnu packages groovy)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system ant)
  #:use-module (guix git-download))

(define-public java-apache-ivy-2.0.0
  (package
    (inherit java-apache-ivy)
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://apache//ant/ivy/" version
                                  "/apache-ivy-" version "-src.tar.gz"))
              (sha256
               (base32
                "07ddff7gpwjqq1fv21867jp4w3444wzzhg2h90g63mgh4vw51dcr"))))))

(define-public java-commons-cli-1.0
  (package
    (inherit java-commons-cli)
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://apache/commons/cli/source/"
                                  "commons-cli-" version "-src.tar.gz"))
              (sha256
               (base32
                "05hgi2z01fqz374y719gl1dxzqvzci5af071zm7vxrjg9vczipm1"))))))

(define-public gradle-bootstrap
  (package
    (name "gradle-bootstrap")
    (version "0.1-snapshot")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/gradle/gradle")
              (commit "e09125febb2abd4d5eb70714ff68cdc76ee7dc45")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0m8wmwi2cryjw2g272w213cw4zb02v61j2x9cfhd3gfvnmi9909x"))))
    (build-system ant-build-system)
    (arguments `(#:phases (modify-phases %standard-phases
        (add-before 'build 'patch-ivy (lambda* (#:key inputs #:allow-other-keys)
          (use-modules (ice-9 textual-ports))
          (mkdir-p "ivy")
          (copy-file (string-append (assoc-ref inputs "java-apache-ivy") "/share/java/ivy.jar") "ivy/ivy-2.0.0.beta2_20080305165542.jar")
          (make-file-writable "ivy/ivy-2.0.0.beta2_20080305165542.jar")
          (mkdir-p "org/apache/ivy/core/settings")
          (let ((file (open-file "org/apache/ivy/core/settings/ivyconf-local.xml" "w")))
            (put-string file "<ivysettings><property name=\"ivy.local.default.root\"             value=\"${ivy.default.ivy.user.dir}/local\" override=\"false\"/><property name=\"ivy.local.default.ivy.pattern\"      value=\"[organisation]/[module]/[revision]/[type]s/[artifact].[ext]\" override=\"false\"/><property name=\"ivy.local.default.artifact.pattern\" value=\"[organisation]/[module]/[revision]/[type]s/[artifact].[ext]\" override=\"false\"/><resolvers><filesystem name=\"local\"><ivy pattern=\"${ivy.local.default.root}/${ivy.local.default.ivy.pattern}\" /><artifact pattern=\"${ivy.local.default.root}/${ivy.local.default.artifact.pattern}\" /></filesystem></resolvers></ivysettings>")
            (close-port file))
          (invoke "zip" "-u" "ivy/ivy-2.0.0.beta2_20080305165542.jar" "org/apache/ivy/core/settings/ivyconf-local.xml")
          (setenv "CLASSPATH" (string-append (getcwd) "/ivy/ivy-2.0.0.beta2_20080305165542.jar" ":" (getenv "CLASSPATH")))
          (setenv "_JAVA_OPTIONS" (string-append "-Duser.home=" (getcwd)))))
        (add-before 'build 'inject-dependencies (lambda* (#:key inputs #:allow-other-keys)
          (mkdir-p ".ivy2/local/commons-cli/commons-cli/1.0/jars") (copy-file (string-append (assoc-ref inputs "java-commons-cli") "/lib/m2/commons-cli/commons-cli/1.4/commons-cli-1.4.jar") ".ivy2/local/commons-cli/commons-cli/1.0/jars/commons-cli.jar")
          (mkdir-p ".ivy2/local/org.codehaus.groovy/groovy-all/1.5.5-032808") (copy-recursively (string-append (assoc-ref inputs "groovy") "/lib") ".ivy2/local/org.codehaus.groovy/groovy-all/1.5.5-032808/jars") (copy-file ".ivy2/local/org.codehaus.groovy/groovy-all/1.5.5-032808/jars/groovy.jar" ".ivy2/local/org.codehaus.groovy/groovy-all/1.5.5-032808/jars/groovy-all.jar")
    )))))
    (native-inputs (list zip java-apache-ivy-2.0.0 java-commons-cli-1.0 groovy))
    (home-page "https://gradle.org")
    (synopsis "Bootstrap gradle")
    (description "Latest gradle buildable without gradle")
    (license license:asl2.0)))
