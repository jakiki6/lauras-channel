(define-module (laura packages languages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages c)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages libedit)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages sphinx))

(define-public swift-cmark
  (package
    (name "swift-cmark")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/swiftlang/swift-cmark")
             (commit "0.6.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16la6vsafic8flv715rf9mj069wynw7xdiaj70hn86wlrwr8fw48"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-targets
            (lambda _
              (install-file "src/cmarkTargets.cmake"
                            (string-append #$output "/lib/cmake")))))))
    (home-page "https://github.com/swiftlang/swift-cmark")
    (synopsis "CommonMark parsing and rendering library and program in C")
    (description
     "cmark-gfm is an extended version of the C reference implementation of CommonMark, a rationalized version of Markdown syntax with a spec. This repository adds GitHub Flavored Markdown extensions to the upstream implementation, as defined in the spec.")
    (license license:bsd-2)))

(define-public swift
  (package
    (name "swift")
    (version "6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/swiftlang/swift")
             (commit "swift-6.1-RELEASE")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "128vmx12713n8yhf0lrmvrrqmvy4mvmfmc2g6gx4ylb1infr94ss"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"
      #:parallel-build? #f
      #:configure-flags
      #~(list (string-append "-Dcmark-gfm_DIR="
                             #$swift-cmark "/lib/cmake")
              (string-append "-DLLVM_DIR="
                             #$llvm-20 "/lib/cmake/llvm")
              (string-append "-DLLVM_BUILD_LIBRARY_DIR="
                             #$llvm-20 "/lib")
              (string-append "-DClang_DIR="
                             #$clang-20 "/lib/cmake/clang")
              (string-append "-DSWIFT_NATIVE_CLANG_TOOLS_PATH="
                             #$clang-20 "/bin")
              "-DSWIFT_ENABLE_DISPATCH=false")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'symlink
            (lambda _
              (mkdir "src")
              (symlink (string-append #$swift-cmark
                                      "/lib/cmake/cmarkTargets.cmake")
                       "src/cmarkTargets.cmake")
              (substitute* "lib/Option/CMakeLists.txt"
                (("set\\(features_file_clang_src.*")
                 "set(features_file_clang_src \"${CMAKE_SOURCE_DIR}/lib/Option/features.json\")\n"))))
          (add-after 'configure 'fix-tree
            (lambda _
              (mkdir-p "share/swift"))))))
    (native-inputs (list pkg-config perl python-sphinx clang-toolchain-20
                         lld-20))
    (inputs (list swift-cmark
                  llvm-20
                  clang-20
                  python-3
                  libxml2
                  libedit
                  (list util-linux "lib")))
    (home-page "https://www.swift.org/")
    (synopsis "The Swift Programming Language")
    (description
     "Swift is a high-performance system programming language. It has a clean and modern syntax, offers seamless access to existing C and Objective-C code and frameworks, and is memory-safe by default.")
    (license license:asl2.0)))
