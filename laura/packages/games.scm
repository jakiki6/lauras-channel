(define-module (laura packages games)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix transformations)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages cmake)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages digest)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages video)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages web)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages libunistring)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages kerberos)
  #:use-module (nonguix licenses)
  #:use-module (nonguix build-system binary)
  #:use-module (laura packages rust-common))

(define-public minecraft-launcher
  (let ((launcher-version "2.2.1441"))
    (package
      (name "minecraft-launcher")
      (version launcher-version)
      (supported-systems '("x86_64-linux"))
      (source
       (origin
         (method url-fetch)
         ;; look at https://launchermeta.mojang.com/v1/products/launcher/6f083b80d5e6fabbc4236f81d0d8f8a350c665a9/linux.json
         (uri
          "https://piston-data.mojang.com/v1/objects/bb5d7a5bd5476db2ce04f52b5c7a74ad8db455a7/minecraft-launcher")
         (sha256
          (base32 "0wf2faz9c0pkj555akhlx2alcl5qh1ilmd1p1d9w48sm7gicck69"))))
      (build-system binary-build-system)
      (arguments
       `(#:phases (modify-phases %standard-phases
                    (add-before 'patchelf 'make-executable
                      (lambda _
                        (chmod "minecraft-launcher" #o755)))
                    (add-after 'install 'wrap
                      (lambda* (#:key inputs outputs #:allow-other-keys)
                        (wrap-program (string-append (assoc-ref outputs "out")
                                       "/bin/minecraft-launcher")
                          `("LD_LIBRARY_PATH" ":" =
                            (,(string-append (assoc-ref inputs "glibc") "/lib") ,
                             (string-append (assoc-ref inputs "gcc") "/lib")
                             ,(string-append (assoc-ref inputs "gdk-pixbuf")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "glib") "/lib")
                             ,(string-append (assoc-ref inputs "gtk+") "/lib")
                             ,(string-append (assoc-ref inputs "curl") "/lib")
                             ,(string-append (assoc-ref inputs "libx11")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "zlib") "/lib")
                             ,(string-append (assoc-ref inputs "util-linux")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "nss")
                                             "/lib/nss")
                             ,(string-append (assoc-ref inputs "nspr") "/lib")
                             ,(string-append (assoc-ref inputs "at-spi2-core")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "cups") "/lib")
                             ,(string-append (assoc-ref inputs "libdrm")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxcomposite")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxdamage")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxext")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxfixes")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxrandr")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "mesa") "/lib")
                             ,(string-append (assoc-ref inputs "expat") "/lib")
                             ,(string-append (assoc-ref inputs "libxcb")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "libxkbcommon")
                                             "/lib")
                             ,(string-append (assoc-ref inputs "dbus") "/lib")
                             ,(string-append (assoc-ref inputs "pango") "/lib")
                             ,(string-append (assoc-ref inputs "cairo") "/lib")
                             ,(string-append (assoc-ref inputs "bzip2") "/lib")
                             ,(string-append (assoc-ref inputs "libcloudproviders-minimal") "/lib")
                             ,(string-append (assoc-ref inputs "libdatrie") "/lib")
                             ,(string-append (assoc-ref inputs "libepoxy") "/lib")
                             ,(string-append (assoc-ref inputs "libffi") "/lib")
                             ,(string-append (assoc-ref inputs "fontconfig-minimal") "/lib")
                             ,(string-append (assoc-ref inputs "freetype") "/lib")
                             ,(string-append (assoc-ref inputs "fribidi") "/lib")
                             ,(string-append (assoc-ref inputs "gmp") "/lib")
                             ,(string-append (assoc-ref inputs "gnutls") "/lib")
                             ,(string-append (assoc-ref inputs "graphite2") "/lib")
                             ,(string-append (assoc-ref inputs "harfbuzz") "/lib")
                             ,(string-append (assoc-ref inputs "nettle") "/lib")
                             ,(string-append (assoc-ref inputs "libidn2") "/lib")
                             ,(string-append (assoc-ref inputs "libjpeg-turbo") "/lib")
                             ,(string-append (assoc-ref inputs "nettle") "/lib")
                             ,(string-append (assoc-ref inputs "p11-kit") "/lib")
                             ,(string-append (assoc-ref inputs "pcre2") "/lib")
                             ,(string-append (assoc-ref inputs "pixman") "/lib")
                             ,(string-append (assoc-ref inputs "libpng") "/lib")
                             ,(string-append (assoc-ref inputs "libpsl") "/lib")
                             ,(string-append (assoc-ref inputs "libtasn1") "/lib")
                             ,(string-append (assoc-ref inputs "libthai") "/lib")
                             ,(string-append (assoc-ref inputs "libunistring") "/lib")
                             ,(string-append (assoc-ref inputs "wayland") "/lib")
                             ,(string-append (assoc-ref inputs "libxau") "/lib")
                             ,(string-append (assoc-ref inputs "libxcursor") "/lib")
                             ,(string-append (assoc-ref inputs "libxdmcp") "/lib")
                             ,(string-append (assoc-ref inputs "libxinerama") "/lib")
                             ,(string-append (assoc-ref inputs "libxi") "/lib")
                             ,(string-append (assoc-ref inputs "libxrender") "/lib")
                             ,(string-append (assoc-ref inputs "libsecret") "/lib")
                             ,(string-append (assoc-ref inputs "libgpg-error") "/lib")
                             ,(string-append (assoc-ref inputs "libgcrypt") "/lib")
                             ,(string-append (assoc-ref inputs "mit-krb5") "/lib")
                             ,(string-append (assoc-ref inputs "e2fsprogs") "/lib")
                             ,(string-append (assoc-ref inputs "nghttp2") "/lib")
                             ,(string-append (assoc-ref inputs "alsa-lib")
                                             "/lib")))))))
         #:patchelf-plan `(("minecraft-launcher" ("glibc" "gcc" "gdk-pixbuf"
                                                  "glib" "gtk+" "curl")))
         #:install-plan `(("minecraft-launcher" "bin/"))))
      (inputs (list (list gcc "lib")
                    (list util-linux "lib")
                    (list nghttp2 "lib")
                    glibc
                    gdk-pixbuf
                    glib
                    gtk+
                    curl
                    libx11
                    zlib
                    nss
                    nspr
                    at-spi2-core
                    cups
                    libdrm
                    libxcomposite
                    libxdamage
                    libxext
                    libxfixes
                    libxrandr
                    mesa
                    expat
                    libxcb
                    libxkbcommon
                    dbus
                    pango
                    cairo
                    bzip2
                    libcloudproviders-minimal
                    libdatrie
                    libepoxy
                    libffi
                    fontconfig
                    freetype
                    fribidi
                    gmp
                    gnutls
                    graphite2
                    harfbuzz
                    nettle
                    libidn2
                    libjpeg-turbo
                    nettle
                    p11-kit
                    pcre2
                    pixman
                    libpng
                    libpsl
                    libtasn1
                    libthai
                    libunistring
                    wayland
                    libxau
                    libxcursor
                    libxdmcp
                    libxinerama
                    libxi
                    libxrender
                    libsecret
                    libgpg-error
                    libgcrypt
                    mit-krb5
                    e2fsprogs
                    alsa-lib))
      (synopsis "Proprietary Minecraft launcher")
      (description "Minecraft launcher binary")
      (home-page "https://www.minecraft.net/")
      (license (nonfree "https://minecraft.net/terms")))))

(define-public ScuffedMinecraft
  (package
    (name "ScuffedMinecraft")
    (version "1.3.0-pre-alpha")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EvanatorM/ScuffedMinecraft")
             (commit "pre-alpha-v1.3.0")))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet #~(substitute* "ScuffedMinecraft/src/Application.cpp"
                    (("#include <thread>")
                     "#include <thread>\n#include <libgen.h>")
                    (("int main\\(\\)")
                     "int main(int argc, char *argv[])")
                    (("glfwInit\\(\\);")
                     "glfwInit();
chdir(strcat(dirname(argv[0]), \"/../share/scuffed_mc\"));")))
       (sha256
        (base32 "15g2rc1ny6z88smsaryvqpy0mzm36b5fcc92595x6gakw5f8n20n"))))
    (build-system cmake-build-system)
    (inputs (list glfw-3.4 mesa))
    (arguments
     (list
      #:tests? #f
      #:build-type "Release"
      #:phases #~(modify-phases %standard-phases
                   (add-before 'configure 'chdir-to-source
                     (lambda _
                       (chdir "ScuffedMinecraft")))
                   (replace 'install
                     (lambda* (#:key inputs outputs #:allow-other-keys)
                       (begin
                         (install-file "../ScuffedMinecraft/bin/scuffed_mc"
                                       (string-append (assoc-ref outputs "out")
                                                      "/bin/"))
                         (mkdir-p (string-append (assoc-ref outputs "out")
                                                 "/share/scuffed_mc/assets"))
                         (copy-recursively "../ScuffedMinecraft/assets"
                                           (string-append (assoc-ref outputs
                                                                     "out")
                                            "/share/scuffed_mc/assets"))
                         (wrap-program (string-append (assoc-ref outputs "out")
                                                      "/bin/scuffed_mc")
                           `("LD_LIBRARY_PATH" =
                             ,(list (string-append (assoc-ref inputs "mesa")
                                                   "/lib"))))))))))
    (home-page "https://github.com/EvanatorM/ScuffedMinecraft")
    (synopsis "A Minecraft Clone in C++")
    (description "A Minecraft clone made in C++ and OpenGL")
    (license license:expat)))

(define-public fceux
  (package
    (name "fceux")
    (version "2.6.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TASEmulators/fceux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02s5qmxdxpsa71977z9bs5vfhnszn5nr5hk05wns8cm9nshbg7as"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f))
    (inputs (list qtbase-5 zlib minizip sdl2))
    (native-inputs (list pkg-config))
    (synopsis "FCEUX, a NES Emulator")
    (description
     "An open source NES Emulator for Windows and Unix that features solid emulation accuracy and state of the art tools for power users. For some reason casual gamers use it too.")
    (home-page "https://fceux.com")
    (license license:gpl2)))

(define-public rpcs3
  (package
    (name "rpcs3")
    (version "0.0.33")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rpcs3/rpcs3/")
             (commit "v0.0.33")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0annwam8k2jhl9qiwqmvkaydk75wzsql2ba141vakvz2kc9rwpmj"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:build-type "Release"
      #:configure-flags #~(list "-Wno-dev"
                                "-DUSE_SYSTEM_OPENAL=ON"
                                "-DUSE_SYSTEM_CURL=ON"
                                "-DUSE_SYSTEM_LIBPNG=ON"
                                "-DUSE_SYSTEM_ZLIB=ON"
                                "-DUSE_SYSTEM_WOLFSSL=OFF"
                                "-DUSE_SYSTEM_FLATBUFFERS=ON"
                                "-DUSE_SYSTEM_PUGIXML=ON"
                                "-DUSE_SYSTEM_LIBUSB=ON"
                                "-DUSE_SYSTEM_XXHASH=ON"
                                "-DUSE_SYSTEM_MVK=ON"
                                "-DUSE_SYSTEM_FAUDIO=ON"
                                "-DUSE_SYSTEM_FFMPEG=ON"
                                "-DUSE_SYSTEM_SDL=ON"
                                "-DUSE_NATIVE_INSTRUCTIONS=OFF")
      #:phases #~(modify-phases %standard-phases
                   (add-before 'build 'fix-source
                     (lambda _
                       (substitute* "../source/rpcs3/Emu/Cell/PPUThread.cpp"
                         (("std::fesetround\\(FE_TONEAREST\\);")
                          ""))
                       (substitute* "../source/rpcs3/Emu/Cell/SPUThread.cpp"
                         (("std::fesetround\\(FE_TOWARDZERO\\);")
                          "")))))))
    (native-inputs (list pkg-config gcc-toolchain-14))
    (inputs (list zlib
                  mesa
                  libglvnd
                  openal
                  glew
                  llvm-16
                  curl
                  qtbase
                  qtmultimedia
                  qtsvg
                  wayland
                  libxkbcommon
                  vulkan-headers
                  libusb
                  libevdev
                  eudev
                  vulkan-loader
                  sdl2
                  pugixml
                  yaml-cpp
                  xxhash
                  libpng
                  faudio
                  miniupnpc
                  rtmidi
                  asmjit
                  cubeb
                  speex
                  glslang
                  hidapi
                  flatbuffers
                  ffmpeg))
    (home-page "https://rpcs3.net")
    (synopsis "PlayStation 3 emulator and debugger.")
    (description
     "The world's first free and open-source PlayStation 3 emulator/debugger, written in C++ for Windows, Linux, macOS and FreeBSD.")
    (license license:gpl2)))

(define-public tpt
  (package
    (name "tpt")
    (version "98.2.365")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/The-Powder-Toy/The-Powder-Toy")
             (commit "v98.2.365")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06l39w3ggrzn8799dqll606by4f88kjr60r879w8j26csx1py76g"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config cmake))
    (inputs (list luajit
                  curl
                  fftwf
                  zlib
                  libpng
                  sdl2
                  ((options->transformation `((with-patch unquote
                                                          (string-append
                                                           "bzip2="
                                                           (search-patch
                                                            "laura/packages/patches/bzip2-pkg-config.patch")))))
                   bzip2)
                  jsoncpp))
    (arguments
     (list
      #:tests? #f
      #:configure-flags #~(list "-Dworkaround_elusive_bzip2=false")))
    (home-page "https://powdertoy.co.uk")
    (synopsis "The Powder Toy")
    (description
     "Written in C++ and using SDL, The Powder Toy is a desktop version of the classic 'falling sand' physics sandbox, it simulates air pressure and velocity as well as heat. ")
    (license license:gpl3)))

(define-public uesave
  (package
    (name "uesave")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uesave" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14rh7c62cmxb5fqd0mss69hih9k7xw8jmbqc04bmni929av3729s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1.0.86)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-clap" ,rust-clap-4.5.6)
                       ("rust-edit" ,rust-edit-0.1)
                       ("rust-indexmap" ,rust-indexmap-2.2.6)
                       ("rust-serde" ,rust-serde-1.0.203)
                       ("rust-serde-json" ,rust-serde-json-1.0.117)
                       ("rust-shell-words" ,rust-shell-words-1)
                       ("rust-tempfile" ,rust-tempfile-3.10.1)
                       ("rust-thiserror" ,rust-thiserror-1.0.61)
                       ("rust-uuid" ,rust-uuid-1))
       #:cargo-development-inputs (("rust-pretty-assertions" ,rust-pretty-assertions-1))))
    (home-page "https://github.com/trumank/uesave-rs")
    (synopsis "Unreal Engine save file (GVAS) reading/writing")
    (description
     "This package provides Unreal Engine save file (GVAS) reading/writing.")
    (license license:expat)))
