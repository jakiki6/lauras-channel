(define-module (laura packages rust-crates)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages rust-sources)
  #:export (lookup-cargo-inputs))

(define rust-adler2-2.0.0
  (crate-source "adler2" "2.0.0"
                "09r6drylvgy8vv8k20lnbvwq8gp09h7smfn6h1rxsy15pgh629si"))

(define rust-ahash-0.8.11
  (crate-source "ahash" "0.8.11"
                "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))

(define rust-aho-corasick-1.1.3
  (crate-source "aho-corasick" "1.1.3"
                "05mrpkvdgp5d20y2p989f187ry9diliijgwrs254fs9s1m1x6q4f"))

(define rust-android-activity-0.6.0
  (crate-source "android-activity" "0.6.0"
                "0inh88x8x2fh62jg739s9hwyvdh8i920qf0qw7bhr802j9c7hsgg"))

(define rust-android-properties-0.2.2
  (crate-source "android-properties" "0.2.2"
                "016slvg269c0y120p9qd8vdfqa2jbw4j0g18gfw6p3ain44v4zpw"))

(define rust-anstream-0.6.18
  (crate-source "anstream" "0.6.18"
                "16sjk4x3ns2c3ya1x28a44kh6p47c7vhk27251i015hik1lm7k4a"))

(define rust-anstyle-1.0.10
  (crate-source "anstyle" "1.0.10"
                "1yai2vppmd7zlvlrp9grwll60knrmscalf8l2qpfz8b7y5lkpk2m"))

(define rust-anstyle-parse-0.2.6
  (crate-source "anstyle-parse" "0.2.6"
                "1acqayy22fwzsrvr6n0lz6a4zvjjcvgr5sm941m7m0b2fr81cb9v"))

(define rust-anstyle-query-1.1.2
  (crate-source "anstyle-query" "1.1.2"
                "036nm3lkyk43xbps1yql3583fp4hg3b1600is7mcyxs1gzrpm53r"))

(define rust-anstyle-wincon-3.0.6
  (crate-source "anstyle-wincon" "3.0.6"
                "099ir0w3lbpsp1nxdzbf4anq98ww8ykyc9pd1g03xgkj1v7dn291"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-as-raw-xcb-connection-1.0.1
  (crate-source "as-raw-xcb-connection" "1.0.1"
                "0sqgpz2ymv5yx76r5j2npjq2x5qvvqnw0vrs35cyv30p3pfp2m8p"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.4.0
  (crate-source "autocfg" "1.4.0"
                "09lz3by90d2hphbq56znag9v87gfpd9gb8nr82hll8z6x2nhprdc"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.6.0
  (crate-source "bitflags" "2.6.0"
                "1pkidwzn3hnxlsl8zizh0bncgbjnw7c41cx7bby26ncbzmiznj5h"))

(define rust-block-0.1.6
  (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))

(define rust-block2-0.5.1
  (crate-source "block2" "0.5.1"
                "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))

(define rust-bumpalo-3.16.0
  (crate-source "bumpalo" "3.16.0"
                "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))

(define rust-bytemuck-1.20.0
  (crate-source "bytemuck" "1.20.0"
                "0nk9llwmvjpjlsrlga1qg3spqvci8g1nr286nhamvn7zcf5chdwb"))

(define rust-bytes-1.9.0
  (crate-source "bytes" "1.9.0"
                "16ykzx24v1x4f42v2lxyvlczqhdfji3v7r4ghwckpwijzvb1hn9j"))

(define rust-calloop-0.13.0
  (crate-source "calloop" "0.13.0"
                "1v5zgidnhsyml403rzr7vm99f8q6r5bxq5gxyiqkr8lcapwa57dr"))

(define rust-calloop-wayland-source-0.3.0
  (crate-source "calloop-wayland-source" "0.3.0"
                "086x5mq16prrcwd9k6bw9an0sp8bj9l5daz4ziz5z4snf2c6m9lm"))

(define rust-cc-1.2.4
  (crate-source "cc" "1.2.4"
                "1bqw7559dq0by6dq5k38rijz5p0wr5sa94s2gb180n0ndfmbnmwi"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-cfg-if-1.0.0
  (crate-source "cfg-if" "1.0.0"
                "1za0vb97n4brpzpv8lsbnzmq5r8f2b0cpqqr0sy8h5bn751xxwds"))

(define rust-cgl-0.3.2
  (crate-source "cgl" "0.3.2"
                "1zs7skrsyrsm759vfy2cygkx52fx91b567a12bpaz1sf4d8hbv8c"))

(define rust-clap-4.5.23
  (crate-source "clap" "4.5.23"
                "110cf0i9fmkfqzqhi1h8za9y0vnr5rwhy3wmv1p0rcgp5vnffd9i"))

(define rust-clap-builder-4.5.23
  (crate-source "clap_builder" "4.5.23"
                "0f28rgc09kdgfq1hgg1bb1ydaw243w6dwyw74syz439k6b32yn1h"))

(define rust-clap-complete-4.5.38
  (crate-source "clap_complete" "4.5.38"
                "00bsiq6jn6br4wrq3165hfl80mk4sdrdq97pgkqpa88ikiaplr6r"))

(define rust-clap-derive-4.5.18
  (crate-source "clap_derive" "4.5.18"
                "1ardb26bvcpg72q9myr7yir3a8c83gx7vxk1cccabsd9n73s1ija"))

(define rust-clap-lex-0.7.4
  (crate-source "clap_lex" "0.7.4"
                "19nwfls5db269js5n822vkc8dw0wjq2h1wf0hgr06ld2g52d2spl"))

(define rust-clipboard-win-3.1.1
  (crate-source "clipboard-win" "3.1.1"
                "0hh3npqfa1lfn62fwvkmjlpfnizq343a994b898ffsvb100mxpwz"))

(define rust-cocoa-0.25.0
  (crate-source "cocoa" "0.25.0"
                "0g1pl5hq28arqmvsswf2ib7smj445miwa58qa7wrfvksz54h857n"))

(define rust-cocoa-foundation-0.1.2
  (crate-source "cocoa-foundation" "0.1.2"
                "1xwk1khdyqw3dwsl15vr8p86shdcn544fr60ass8biz4nb5k8qlc"))

(define rust-colorchoice-1.0.3
  (crate-source "colorchoice" "1.0.3"
                "1439m3r3jy3xqck8aa13q658visn71ki76qa93cy55wkmalwlqsv"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-copypasta-0.10.1
  (crate-source "copypasta" "0.10.1"
                "0n58sfbahs49ar0qivz1sqz1ixhh1ifgp5bzifjkvabwhqi59f6y"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-core-graphics-0.23.2
  (crate-source "core-graphics" "0.23.2"
                "10dhv3gk4kmbzl14xxkrhhky4fdp8h6nzff6h0019qgr6nz84xy0"))

(define rust-core-graphics-types-0.1.3
  (crate-source "core-graphics-types" "0.1.3"
                "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5"))

(define rust-core-text-20.1.0
  (crate-source "core-text" "20.1.0"
                "1mffma8w0ic11ydv6zclamw4dslzmsych1fwz14msih8bh5pkln9"))

(define rust-crc32fast-1.4.2
  (crate-source "crc32fast" "1.4.2"
                "1czp7vif73b8xslr3c9yxysmh9ws2r8824qda7j47ffs9pcnjxx9"))

(define rust-crossbeam-channel-0.5.13
  (crate-source "crossbeam-channel" "0.5.13"
                "1wkx45r34v7g3wyi3lg2wz536lrrrab4h4hh741shfhr8rlhsj1k"))

(define rust-crossbeam-utils-0.8.20
  (crate-source "crossbeam-utils" "0.8.20"
                "100fksq5mm1n7zj242cclkw6yf7a4a8ix3lvpfkhxvdhbda9kv12"))

(define rust-crossfont-0.8.0
  (crate-source "crossfont" "0.8.0"
                "1g490ap42qm1258222azy70mmd6b16dk8lza0142bjgk438jhkn4"))

(define rust-cstr-0.2.12
  (crate-source "cstr" "0.2.12"
                "0dj6ll9ry27kn4k0vvhlvbhn9dyyr9haxnd06bxaqnmfr01kjlk8"))

(define rust-cursor-icon-1.1.0
  (crate-source "cursor-icon" "1.1.0"
                "14brf4vd6az9hnszwzqj7xyfaymqx9806d4i7xmwlaja3wjsr9ln"))

(define rust-dirs-5.0.1
  (crate-source "dirs" "5.0.1"
                "0992xk5vx75b2x91nw9ssb51mpl8x73j9rxmpi96cryn0ffmmi24"))

(define rust-dirs-sys-0.4.1
  ;; TODO: Check bundled sources.
  (crate-source "dirs-sys" "0.4.1"
                "071jy0pvaad9lsa6mzawxrh7cmr7hsmsdxwzm7jzldfkrfjha3sj"))

(define rust-dispatch-0.2.0
  (crate-source "dispatch" "0.2.0"
                "0fwjr9b7582ic5689zxj8lf7zl94iklhlns3yivrnv8c9fxr635x"))

(define rust-dlib-0.5.2
  (crate-source "dlib" "0.5.2"
                "04m4zzybx804394dnqs1blz241xcy480bdwf3w9p4k6c3l46031k"))

(define rust-downcast-rs-1.2.1
  (crate-source "downcast-rs" "1.2.1"
                "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))

(define rust-dpi-0.1.1
  (crate-source "dpi" "0.1.1"
                "0lzz48gpgbwdrw0s8vib0589ij9jizv1vzsphm4xd9kw58lhwp7j"))

(define rust-dwrote-0.11.2
  (crate-source "dwrote" "0.11.2"
                "1z85pyzac4zpap94czx7nkn1hys64n95ddlnpar34djsa84jf63h"))

(define rust-embed-resource-2.5.1
  (crate-source "embed-resource" "2.5.1"
                "0yb3kbw3xpghiwf69769jpng725kwa2cxm27qj5s7dm0cfgnz2xn"))

(define rust-equivalent-1.0.1
  (crate-source "equivalent" "1.0.1"
                "1malmx5f4lkfvqasz319lq6gb3ddg19yzf9s8cykfsgzdmyq0hsl"))

(define rust-errno-0.3.10
  (crate-source "errno" "0.3.10"
                "0pgblicz1kjz9wa9m0sghkhh2zw1fhq1mxzj7ndjm746kg5m5n1k"))

(define rust-fastrand-2.3.0
  (crate-source "fastrand" "2.3.0"
                "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-fdeflate-0.3.7
  (crate-source "fdeflate" "0.3.7"
                "130ga18vyxbb5idbgi07njymdaavvk6j08yh1dfarm294ssm6s0y"))

(define rust-filetime-0.2.25
  (crate-source "filetime" "0.2.25"
                "11l5zr86n5sr6g6k6sqldswk0jzklm0q95rzikxcns0yk0p55h1m"))

(define rust-flate2-1.0.35
  (crate-source "flate2" "1.0.35"
                "0z6h0wa095wncpfngx75wyhyjnqwld7wax401gsvnzjhzgdbydn9"))

(define rust-foreign-types-0.5.0
  (crate-source "foreign-types" "0.5.0"
                "0rfr2zfxnx9rz3292z5nyk8qs2iirznn5ff3rd4vgdwza6mdjdyp"))

(define rust-foreign-types-macros-0.2.3
  (crate-source "foreign-types-macros" "0.2.3"
                "0hjpii8ny6l7h7jpns2cp9589016l8mlrpaigcnayjn9bdc6qp0s"))

(define rust-foreign-types-shared-0.3.1
  (crate-source "foreign-types-shared" "0.3.1"
                "0nykdvv41a3d4py61bylmlwjhhvdm0b3bcj9vxhqgxaxnp5ik6ma"))

(define rust-freetype-rs-0.36.0
  (crate-source "freetype-rs" "0.36.0"
                "05rbdl18ks2rb0kz7giwpcv7k1hfg19hbp406l9h95m0dkixwhjl"))

(define rust-freetype-sys-0.20.1
  ;; TODO: Check bundled sources.
  (crate-source "freetype-sys" "0.20.1"
                "0d5iiv95ap3lwy7b0hxbc8caa9ng1fg3wlwrvb7rld39jrdxqzhf"))

(define rust-fsevent-sys-4.1.0
  ;; TODO: Check bundled sources.
  (crate-source "fsevent-sys" "4.1.0"
                "1liz67v8b0gcs8r31vxkvm2jzgl9p14i78yfqx81c8sdv817mvkn"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-gethostname-0.4.3
  (crate-source "gethostname" "0.4.3"
                "063qqhznyckwx9n4z4xrmdv10s0fi6kbr17r6bi1yjifki2y0xh1"))

(define rust-getrandom-0.2.15
  (crate-source "getrandom" "0.2.15"
                "1mzlnrb3dgyd1fb84gvw10pyr8wdqdl4ry4sr64i1s8an66pqmn4"))

(define rust-gl-generator-0.14.0
  (crate-source "gl_generator" "0.14.0"
                "0k8j1hmfnff312gy7x1aqjzcm8zxid7ij7dlb8prljib7b1dz58s"))

(define rust-glutin-0.32.2
  (crate-source "glutin" "0.32.2"
                "0j28jyhkwp4hjwji01n8m8nxyx8za643xvmhvs926qnf1j5jnr03"))

(define rust-glutin-egl-sys-0.7.1
  ;; TODO: Check bundled sources.
  (crate-source "glutin_egl_sys" "0.7.1"
                "1lh2rj77yvdqjx913nrf7xs5h3ialkkldfn3ppz29x4mc6x80ijc"))

(define rust-glutin-glx-sys-0.6.1
  ;; TODO: Check bundled sources.
  (crate-source "glutin_glx_sys" "0.6.1"
                "118ifprw3y4jwrr25x862gh9hwd7fniwpywr4ihqpa25h29v4ywa"))

(define rust-glutin-wgl-sys-0.6.1
  ;; TODO: Check bundled sources.
  (crate-source "glutin_wgl_sys" "0.6.1"
                "0gng2810jb5x133lmy17qifjx6s90lnprm86afg7mfls505y0kic"))

(define rust-hashbrown-0.15.2
  (crate-source "hashbrown" "0.15.2"
                "12dj0yfn59p3kh3679ac0w1fagvzf4z2zp87a13gbbqbzw0185dz"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.4.0
  (crate-source "hermit-abi" "0.4.0"
                "1k1zwllx6nfq417hy38x4akw1ivlv68ymvnzyxs76ffgsqcskxpv"))

(define rust-home-0.5.9
  (crate-source "home" "0.5.9"
                "19grxyg35rqfd802pcc9ys1q3lafzlcjcv2pl2s5q8xpyr5kblg3"))

(define rust-indexmap-2.7.0
  (crate-source "indexmap" "2.7.0"
                "07s7jmdymvd0rm4yswp0j3napx57hkjm9gs9n55lvs2g78vj5y32"))

(define rust-inotify-0.9.6
  (crate-source "inotify" "0.9.6"
                "1zxb04c4qccp8wnr3v04l503qpxzxzzzph61amlqbsslq4z9s1pq"))

(define rust-inotify-sys-0.1.5
  ;; TODO: Check bundled sources.
  (crate-source "inotify-sys" "0.1.5"
                "1syhjgvkram88my04kv03s0zwa66mdwa5v7ddja3pzwvx2sh4p70"))

(define rust-is-terminal-polyfill-1.70.1
  (crate-source "is_terminal_polyfill" "1.70.1"
                "1kwfgglh91z33kl0w5i338mfpa3zs0hidq5j4ny4rmjwrikchhvr"))

(define rust-itoa-1.0.14
  (crate-source "itoa" "1.0.14"
                "0x26kr9m062mafaxgcf2p6h2x7cmixm0zw95aipzn2hr3d5jlnnp"))

(define rust-jni-0.21.1
  (crate-source "jni" "0.21.1"
                "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs"))

(define rust-jni-sys-0.3.0
  ;; TODO: Check bundled sources.
  (crate-source "jni-sys" "0.3.0"
                "0c01zb9ygvwg9wdx2fii2d39myzprnpqqhy7yizxvjqp5p04pbwf"))

(define rust-jobserver-0.1.32
  (crate-source "jobserver" "0.1.32"
                "1l2k50qmj84x9mn39ivjz76alqmx72jhm12rw33zx9xnpv5xpla8"))

(define rust-js-sys-0.3.76
  ;; TODO: Check bundled sources.
  (crate-source "js-sys" "0.3.76"
                "1dz7v777h2j38wkf8k5iwkfxskn6nff2cdv2jsslyxkpn2svc5v7"))

(define rust-khronos-api-3.1.0
  (crate-source "khronos_api" "3.1.0"
                "1p0xj5mlbagqyvvnv8wmv3cr7l9y1m153888pxqwg3vk3mg5inz2"))

(define rust-kqueue-1.0.8
  (crate-source "kqueue" "1.0.8"
                "033x2knkbv8d3jy6i9r32jcgsq6zm3g97zh5la43amkv3g5g2ivl"))

(define rust-kqueue-sys-1.0.4
  ;; TODO: Check bundled sources.
  (crate-source "kqueue-sys" "1.0.4"
                "12w3wi90y4kwis4k9g6fp0kqjdmc6l00j16g8mgbhac7vbzjb5pd"))

(define rust-lazy-bytes-cast-5.0.1
  (crate-source "lazy-bytes-cast" "5.0.1"
                "0sr0dy1jfg7bjwm9js4hk0ngl0cmgparq2idv1m1bkc9y2cp898h"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-libc-0.2.168
  (crate-source "libc" "0.2.168"
                "0vab4inpw0dz78nii02hsxp1skqn06xzh64psw8wl1h63scb5bjs"))

(define rust-libloading-0.8.6
  (crate-source "libloading" "0.8.6"
                "0d2ccr88f8kv3x7va2ccjxalcjnhrci4j2kwxp7lfmbkpjs4wbzw"))

(define rust-libredox-0.1.3
  (crate-source "libredox" "0.1.3"
                "139602gzgs0k91zb7dvgj1qh4ynb8g1lbxsswdim18hcb6ykgzy0"))

(define rust-linux-raw-sys-0.4.14
  ;; TODO: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.14"
                "12gsjgbhhjwywpqcrizv80vrp7p7grsz5laqq773i33wphjsxcvq"))

(define rust-lock-api-0.4.12
  (crate-source "lock_api" "0.4.12"
                "05qvxa6g27yyva25a5ghsg85apdxkvr77yhkyhapj6r8vnf8pbq7"))

(define rust-log-0.4.22
  (crate-source "log" "0.4.22"
                "093vs0wkm1rgyykk7fjbqp2lwizbixac1w52gv109p5r4jh0p9x7"))

(define rust-malloc-buf-0.0.6
  (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))

(define rust-memchr-2.7.4
  (crate-source "memchr" "2.7.4"
                "18z32bhxrax0fnjikv475z7ii718hq457qwmaryixfxsl2qrmjkq"))

(define rust-memmap2-0.9.5
  (crate-source "memmap2" "0.9.5"
                "0krpvvkpg4i3l05cv3q2xk24a1vj5c86gbrli2wzhj1qkpnpwgzx"))

(define rust-memoffset-0.9.0
  (crate-source "memoffset" "0.9.0"
                "0v20ihhdzkfw1jx00a7zjpk2dcp5qjq6lz302nyqamd9c4f4nqss"))

(define rust-miniz-oxide-0.8.0
  (crate-source "miniz_oxide" "0.8.0"
                "1wadxkg6a6z4lr7kskapj5d8pxlx7cp1ifw4daqnkzqjxych5n72"))

(define rust-mio-0.8.11
  (crate-source "mio" "0.8.11"
                "034byyl0ardml5yliy1hmvx8arkmn9rv479pid794sm07ia519m4"))

(define rust-miow-0.6.0
  (crate-source "miow" "0.6.0"
                "0i307jyhxnhgzj148cdb9zq59rhlhr1b65g142g9z9r01d1pd7rm"))

(define rust-ndk-0.9.0
  (crate-source "ndk" "0.9.0"
                "1m32zpmi5w1pf3j47k6k5fw395dc7aj8d0mdpsv53lqkprxjxx63"))

(define rust-ndk-context-0.1.1
  (crate-source "ndk-context" "0.1.1"
                "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17"))

(define rust-ndk-sys-0.6.0+11769913
  ;; TODO: Check bundled sources.
  (crate-source "ndk-sys" "0.6.0+11769913"
                "0wx8r6pji20if4xs04g73gxl98nmjrfc73z0v6w1ypv6a4qdlv7f"))

(define rust-notify-6.1.1
  (crate-source "notify" "6.1.1"
                "0bad98r0ilkhhq2jg3zs11zcqasgbvxia8224wpasm74n65vs1b2"))

(define rust-num-enum-0.7.3
  (crate-source "num_enum" "0.7.3"
                "0yai0vafhy85mvhknzfqd7lm04hzaln7i5c599rhy8mj831kyqaf"))

(define rust-num-enum-derive-0.7.3
  (crate-source "num_enum_derive" "0.7.3"
                "0mksna1jj87ydh146gn6jcqkvvs920c3dgh0p4f3xk184kpl865g"))

(define rust-objc-0.2.7
  (crate-source "objc" "0.2.7"
                "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi"))

(define rust-objc-foundation-0.1.1
  (crate-source "objc-foundation" "0.1.1"
                "1y9bwb3m5fdq7w7i4bnds067dhm4qxv4m1mbg9y61j9nkrjipp8s"))

(define rust-objc-id-0.1.1
  (crate-source "objc_id" "0.1.1"
                "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))

(define rust-objc-sys-0.3.5
  ;; TODO: Check bundled sources.
  (crate-source "objc-sys" "0.3.5"
                "0423gry7s3rmz8s3pzzm1zy5mdjif75g6dbzc2lf2z0c77fipffd"))

(define rust-objc2-0.5.2
  (crate-source "objc2" "0.5.2"
                "015qa2d3vh7c1j2736h5wjrznri7x5ic35vl916c22gzxva8b9s6"))

(define rust-objc2-app-kit-0.2.2
  (crate-source "objc2-app-kit" "0.2.2"
                "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))

(define rust-objc2-cloud-kit-0.2.2
  (crate-source "objc2-cloud-kit" "0.2.2"
                "02dhjvmcq8c2bwj31jx423jygif1scs9f0lmlab0ayhw75b3ppbl"))

(define rust-objc2-contacts-0.2.2
  (crate-source "objc2-contacts" "0.2.2"
                "12a8m927xrrxa54xhqhqnkkl1a6l07pyrpnqfk9jz09kkh755zx5"))

(define rust-objc2-core-data-0.2.2
  (crate-source "objc2-core-data" "0.2.2"
                "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))

(define rust-objc2-core-image-0.2.2
  (crate-source "objc2-core-image" "0.2.2"
                "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))

(define rust-objc2-core-location-0.2.2
  (crate-source "objc2-core-location" "0.2.2"
                "10apgsrigqryvi4rcc0f6yfjflvrl83f4bi5hkr48ck89vizw300"))

(define rust-objc2-encode-4.0.3
  (crate-source "objc2-encode" "4.0.3"
                "1y7hjg4k828zhn4fjnbidrz3vzw4llk9ldy92drj47ydjc9yg4bq"))

(define rust-objc2-foundation-0.2.2
  (crate-source "objc2-foundation" "0.2.2"
                "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))

(define rust-objc2-link-presentation-0.2.2
  (crate-source "objc2-link-presentation" "0.2.2"
                "160k4qh00yrx57dabn3hzas4r98kmk9bc0qsy1jvwday3irax8d1"))

(define rust-objc2-metal-0.2.2
  (crate-source "objc2-metal" "0.2.2"
                "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))

(define rust-objc2-quartz-core-0.2.2
  (crate-source "objc2-quartz-core" "0.2.2"
                "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))

(define rust-objc2-symbols-0.2.2
  (crate-source "objc2-symbols" "0.2.2"
                "1p04hjkxan18g2b7h9n2n8xxsvazapv2h6mfmmdk06zc7pz4ws0a"))

(define rust-objc2-ui-kit-0.2.2
  (crate-source "objc2-ui-kit" "0.2.2"
                "0vrb5r8z658l8c19bx78qks8c5hg956544yirf8npk90idwldfxq"))

(define rust-objc2-uniform-type-identifiers-0.2.2
  (crate-source "objc2-uniform-type-identifiers" "0.2.2"
                "1ziv4wkbxcaw015ypg0q49ycl7m14l3x56mpq2k1rznv92bmzyj4"))

(define rust-objc2-user-notifications-0.2.2
  (crate-source "objc2-user-notifications" "0.2.2"
                "1cscv2w3vxzaslz101ddv0z9ycrrs4ayikk4my4qd3im8bvcpkvn"))

(define rust-once-cell-1.20.2
  (crate-source "once_cell" "1.20.2"
                "0xb7rw1aqr7pa4z3b00y7786gyf8awx2gca3md73afy76dzgwq8j"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-orbclient-0.3.48
  (crate-source "orbclient" "0.3.48"
                "0hzxjsvvsl5i9d3aqzc6kdcsch1i6flij5dkignhhkz2qb72c2xs"))

(define rust-parking-lot-0.12.3
  (crate-source "parking_lot" "0.12.3"
                "09ws9g6245iiq8z975h8ycf818a66q3c6zv4b5h8skpm7hc1igzi"))

(define rust-parking-lot-core-0.9.10
  (crate-source "parking_lot_core" "0.9.10"
                "1y3cf9ld9ijf7i4igwzffcn0xl16dxyn4c5bwgjck1dkgabiyh0y"))

(define rust-percent-encoding-2.3.1
  (crate-source "percent-encoding" "2.3.1"
                "0gi8wgx0dcy8rnv1kywdv98lwcx67hz0a0zwpib5v2i08r88y573"))

(define rust-pin-project-1.1.7
  (crate-source "pin-project" "1.1.7"
                "15cvflrzsgp1zbl5gv37al2r62nl8lc37xkfwf70ql3fji7gcmxy"))

(define rust-pin-project-internal-1.1.7
  (crate-source "pin-project-internal" "1.1.7"
                "133mxf5vmvnvw4idw2y2lb5bxsza2xlyfl6psjy7mz3l12nmy3rw"))

(define rust-pin-project-lite-0.2.15
  (crate-source "pin-project-lite" "0.2.15"
                "1zz4xif3iknfrpmvqmh0pcc9mx4cxm28jywqydir3pimcla1wnli"))

(define rust-piper-0.2.4
  (crate-source "piper" "0.2.4"
                "0rn0mjjm0cwagdkay77wgmz3sqf8fqmv9d9czm79mvr2yj8c9j4n"))

(define rust-pkg-config-0.3.31
  (crate-source "pkg-config" "0.3.31"
                "1wk6yp2phl91795ia0lwkr3wl4a9xkrympvhqq8cxk4d75hwhglm"))

(define rust-png-0.17.15
  (crate-source "png" "0.17.15"
                "07918iqrf9m1grgixk252bvvw5fgl64ymqkh89hzzgb5bfyq4xdn"))

(define rust-polling-3.7.4
  (crate-source "polling" "3.7.4"
                "0bs4nhwfwsvlzlhah2gbhj3aa9ynvchv2g350wapswh26a65c156"))

(define rust-proc-macro-crate-3.2.0
  (crate-source "proc-macro-crate" "3.2.0"
                "0yzsqnavb3lmrcsmbrdjfrky9vcbl46v59xi9avn0796rb3likwf"))

(define rust-proc-macro2-1.0.92
  (crate-source "proc-macro2" "1.0.92"
                "1c1vjy5wg8iy7kxsxda564qf4ljp0asysmbn2i7caj177x5m9lrp"))

(define rust-quick-xml-0.36.2
  (crate-source "quick-xml" "0.36.2"
                "1zj3sjcjk6sn544wb2wvhr1km5f9cy664vzclygfsnph9mxrlr7p"))

(define rust-quote-1.0.37
  (crate-source "quote" "1.0.37"
                "1brklraw2g34bxy9y4q1nbrccn7bv36ylihv12c9vlcii55x7fdm"))

(define rust-raw-window-handle-0.6.2
  (crate-source "raw-window-handle" "0.6.2"
                "0ff5c648hncwx7hm2a8fqgqlbvbl4xawb6v3xxv9wkpjyrr5arr0"))

(define rust-redox-syscall-0.4.1
  (crate-source "redox_syscall" "0.4.1"
                "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7"))

(define rust-redox-syscall-0.5.8
  (crate-source "redox_syscall" "0.5.8"
                "0d48ylyd6gsamynyp257p6n2zl4dw2fhnn5z9y3nhgpri6rn5a03"))

(define rust-redox-users-0.4.6
  (crate-source "redox_users" "0.4.6"
                "0hya2cxx6hxmjfxzv9n8rjl5igpychav7zfi1f81pz6i4krry05s"))

(define rust-regex-automata-0.4.9
  (crate-source "regex-automata" "0.4.9"
                "02092l8zfh3vkmk47yjc8d631zhhcd49ck2zr133prvd3z38v7l0"))

(define rust-regex-syntax-0.8.5
  (crate-source "regex-syntax" "0.8.5"
                "0p41p3hj9ww7blnbwbj9h7rwxzxg0c1hvrdycgys8rxyhqqw859b"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-0.38.42
  (crate-source "rustix" "0.38.42"
                "11fvprv3p450ggyqacp7sdpjbbsgm5zvfjwnzy8bfbmbrf7c6ggr"))

(define rust-rustix-openpty-0.1.1
  (crate-source "rustix-openpty" "0.1.1"
                "04pw7k8z1fk3642f9wr4jy1f2f6rly4pf2485jw4whn1kynklp52"))

(define rust-ryu-1.0.18
  (crate-source "ryu" "1.0.18"
                "17xx2s8j1lln7iackzd9p0sv546vjq71i779gphjq923vjh5pjzk"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scoped-tls-1.0.1
  (crate-source "scoped-tls" "1.0.1"
                "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-sctk-adwaita-0.10.1
  (crate-source "sctk-adwaita" "0.10.1"
                "1v14vqp7k39jk7pgaibwc06qq9vcmi82k7zlv3qpfvq52w17y9xn"))

(define rust-semver-1.0.24
  (crate-source "semver" "1.0.24"
                "1fmvjjkd3f64y5fqr1nakkq371mnwzv09fbz5mbmdxril63ypdiw"))

(define rust-serde-1.0.216
  (crate-source "serde" "1.0.216"
                "13ikqs0cvd220530x4rj1m9ab5wcflrwkw7cpvl9fnlkdq0q35qb"))

(define rust-serde-derive-1.0.216
  (crate-source "serde_derive" "1.0.216"
                "0pm5bm4354n40ir12bbs829arlqwjrw0wmzd4xk5r1kkpzdmky26"))

(define rust-serde-json-1.0.133
  (crate-source "serde_json" "1.0.133"
                "0xz3bswa527wln3fy0qb7y081nx3cp5yy1ggjhi6n5mrfcjfpz67"))

(define rust-serde-spanned-0.6.8
  (crate-source "serde_spanned" "0.6.8"
                "1q89g70azwi4ybilz5jb8prfpa575165lmrffd49vmcf76qpqq47"))

(define rust-serde-yaml-0.9.34+deprecated
  (crate-source "serde_yaml" "0.9.34+deprecated"
                "0isba1fjyg3l6rxk156k600ilzr8fp7crv82rhal0rxz5qd1m2va"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-0.3.17
  (crate-source "signal-hook" "0.3.17"
                "0098nsah04spqf3n8niirmfym4wsdgjl57c78kmzijlq8xymh8c6"))

(define rust-signal-hook-registry-1.4.2
  (crate-source "signal-hook-registry" "1.4.2"
                "1cb5akgq8ajnd5spyn587srvs4n26ryq0p78nswffwhv46sf1sd9"))

(define rust-simd-adler32-0.3.7
  (crate-source "simd-adler32" "0.3.7"
                "1zkq40c3iajcnr5936gjp9jjh1lpzhy44p3dq3fiw75iwr1w2vfn"))

(define rust-slab-0.4.9
  (crate-source "slab" "0.4.9"
                "0rxvsgir0qw5lkycrqgb1cxsvxzjv9bmx73bk5y42svnzfba94lg"))

(define rust-smallvec-1.13.2
  (crate-source "smallvec" "1.13.2"
                "0rsw5samawl3wsw6glrsb127rx6sh89a8wyikicw6dkdcjd1lpiw"))

(define rust-smithay-client-toolkit-0.19.2
  (crate-source "smithay-client-toolkit" "0.19.2"
                "05h05hg4dn3v6br5jbdbs5nalk076a64s7fn6i01nqzby2hxwmrl"))

(define rust-smithay-clipboard-0.7.2
  (crate-source "smithay-clipboard" "0.7.2"
                "0inqnr4x458nqz0wdcanbgn77dad3bj0m7pjj074lrv3qkp1d0nc"))

(define rust-smol-str-0.2.2
  (crate-source "smol_str" "0.2.2"
                "1bfylqf2vnqaglw58930vpxm2rfzji5gjp15a2c0kh8aj6v8ylyx"))

(define rust-strict-num-0.1.1
  (crate-source "strict-num" "0.1.1"
                "0cb7l1vhb8zj90mzm8avlk815k40sql9515s865rqdrdfavvldv6"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-syn-2.0.90
  (crate-source "syn" "2.0.90"
                "0cfg5dsr1x0hl6b9hz08jp1197mx0rq3xydqmqaws36xlms3p7ci"))

(define rust-tempfile-3.14.0
  (crate-source "tempfile" "3.14.0"
                "037f9jm13bmfc6xq9w86dp0nylrddh6ynvl6db4gm1xwzi8y5k18"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-tiny-skia-0.11.4
  (crate-source "tiny-skia" "0.11.4"
                "1aq9gd4qh4418g8v08qzakqqggx8hl66qcianl3k5bjdsja37lc3"))

(define rust-tiny-skia-path-0.11.4
  (crate-source "tiny-skia-path" "0.11.4"
                "14ywbdfakvacl6rxxmzbnycplaxpc6i2linh2yqk0sp8qb07z7lw"))

(define rust-toml-0.8.19
  (crate-source "toml" "0.8.19"
                "0knjd3mkxyb87qcs2dark3qkpadidap3frqfj5nqvhpxwfc1zvd1"))

(define rust-toml-datetime-0.6.8
  (crate-source "toml_datetime" "0.6.8"
                "0hgv7v9g35d7y9r2afic58jvlwnf73vgd1mz2k8gihlgrf73bmqd"))

(define rust-toml-edit-0.22.22
  (crate-source "toml_edit" "0.22.22"
                "1xf7sxfzmnc45f75x302qrn5aph52vc8w226v59yhrm211i8vr2a"))

(define rust-tracing-0.1.41
  (crate-source "tracing" "0.1.41"
                "1l5xrzyjfyayrwhvhldfnwdyligi1mpqm8mzbi2m1d6y6p2hlkkq"))

(define rust-tracing-core-0.1.33
  (crate-source "tracing-core" "0.1.33"
                "170gc7cxyjx824r9kr17zc9gvzx89ypqfdzq259pr56gg5bwjwp6"))

(define rust-unicode-ident-1.0.14
  (crate-source "unicode-ident" "1.0.14"
                "10ywa1pg0glgkr4l3dppjxizr9r2b7im0ycbfa0137l69z5fdfdd"))

(define rust-unicode-segmentation-1.12.0
  (crate-source "unicode-segmentation" "1.12.0"
                "14qla2jfx74yyb9ds3d2mpwpa4l4lzb9z57c6d2ba511458z5k7n"))

(define rust-unicode-width-0.1.14
  (crate-source "unicode-width" "0.1.14"
                "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))

(define rust-unsafe-libyaml-0.2.11
  (crate-source "unsafe-libyaml" "0.2.11"
                "0qdq69ffl3v5pzx9kzxbghzn0fzn266i1xn70y88maybz9csqfk7"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-vswhom-0.1.0
  (crate-source "vswhom" "0.1.0"
                "12v0fjjzxdc3y5c0lcwycfhphz7zf2s06hl5krwhawah0xzrp5xy"))

(define rust-vswhom-sys-0.1.2
  ;; TODO: Check bundled sources.
  (crate-source "vswhom-sys" "0.1.2"
                "065s8kx9sbrgjpmzxgiczyhb90xzxq9d95nd0s2v58n8yvhpmcfk"))

(define rust-vte-generate-state-changes-0.1.2
  (crate-source "vte_generate_state_changes" "0.1.2"
                "0biwgpcji3w4llz7h4bi8c2rwqchm9gmyr7dnjki1m853gp9ndif"))

(define rust-vte-graphics-0.13.1
  (crate-source "vte-graphics" "0.13.1"
                "1gf4xmx7jifihd5ckpkrrc3g4nbr1f48ldgdiq9ikgvfpqqpamks"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-wasi-0.11.0+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.0+wasi-snapshot-preview1"
                "08z4hxwkpdpalxjps1ai9y7ihin26y9f476i53dv98v45gkqg3cw"))

(define rust-wasm-bindgen-0.2.99
  (crate-source "wasm-bindgen" "0.2.99"
                "15k3rzb3kjrxyqnh0916gq99mrpwhwy62smawxxc2w0x3llgcx54"))

(define rust-wasm-bindgen-backend-0.2.99
  (crate-source "wasm-bindgen-backend" "0.2.99"
                "0ycwa4c68j34687k513djgyy2asn3fw3yp4g9rkq2kvbchwbp2az"))

(define rust-wasm-bindgen-futures-0.4.49
  (crate-source "wasm-bindgen-futures" "0.4.49"
                "18pc937q8kg549czxk3ah57h9vb7q56c62zz9qcfk17a8jdns5rq"))

(define rust-wasm-bindgen-macro-0.2.99
  (crate-source "wasm-bindgen-macro" "0.2.99"
                "1znlcrk5bvisr3vscwlqkdby959n3sb367zgdzpjwjd7v4giiiic"))

(define rust-wasm-bindgen-macro-support-0.2.99
  (crate-source "wasm-bindgen-macro-support" "0.2.99"
                "1hihsgyg0kf46kjhgfv8x5g9x0q1d0aizj6n7s84ag1xfrdskmrh"))

(define rust-wasm-bindgen-shared-0.2.99
  (crate-source "wasm-bindgen-shared" "0.2.99"
                "19h61snrhh1qhb5gz6zyb89l7fbj1fhmxcvi09p9l0mav8zsnfll"))

(define rust-wayland-backend-0.3.7
  (crate-source "wayland-backend" "0.3.7"
                "1xhnh0mn4cv0wmq3zcm0iic2sbhsz4qdra6kb58x8l51sz73ar85"))

(define rust-wayland-client-0.31.7
  (crate-source "wayland-client" "0.31.7"
                "105j23dj1k36rpvv3nk5v3lm99gs029k3k429kbnzxv9zk9ljqmn"))

(define rust-wayland-csd-frame-0.3.0
  (crate-source "wayland-csd-frame" "0.3.0"
                "0zjcmcqprfzx57hlm741n89ssp4sha5yh5cnmbk2agflvclm0p32"))

(define rust-wayland-cursor-0.31.7
  (crate-source "wayland-cursor" "0.31.7"
                "0k4yijr0rxlqw15clzbh6a3jd760l1xz3zg0gxg07c7xmb1qpc1j"))

(define rust-wayland-protocols-0.32.5
  (crate-source "wayland-protocols" "0.32.5"
                "13pmq788d2w9c7sqpjjxi1344bzq1g1ja4vlaa4rlvjfgkjsvl3w"))

(define rust-wayland-protocols-plasma-0.3.5
  (crate-source "wayland-protocols-plasma" "0.3.5"
                "1g8jxv1k3zdbcqmhr4fpghgibp2940hz45sm2pmwfs7f92swlccv"))

(define rust-wayland-protocols-wlr-0.3.5
  (crate-source "wayland-protocols-wlr" "0.3.5"
                "08j0xfpfqv6kzbfzmdv6crfzalxbxc2n5m9hc4qkqg4jrpv14bkq"))

(define rust-wayland-scanner-0.31.5
  (crate-source "wayland-scanner" "0.31.5"
                "1hv16shy6j32hi9i0r54pyk5pw3q7qfpkffmwchi3z75n80j0zsr"))

(define rust-wayland-sys-0.31.5
  ;; TODO: Check bundled sources.
  (crate-source "wayland-sys" "0.31.5"
                "02cyl94ydazgjdjf7asm2phni8h62j4cg4pwr6sy7lwfiq6sra7g"))

(define rust-web-sys-0.3.76
  ;; TODO: Check bundled sources.
  (crate-source "web-sys" "0.3.76"
                "1g0j3kii20mh7hqmdajz2r4c21zynb9h9h026wymalkx88ip5p84"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.9
  (crate-source "winapi-util" "0.1.9"
                "1fqhkcl9scd230cnfj8apfficpf5c9vhwnk4yy9xfc1sw69iq8ng"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source "windows_aarch64_gnullvm" "0.48.5"
                "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source "windows_aarch64_msvc" "0.48.5"
                "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.48.5
  (crate-source "windows_i686_gnu" "0.48.5"
                "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.48.5
  (crate-source "windows_i686_msvc" "0.48.5"
                "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-sys-0.45.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.48.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-sys-0.52.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-targets-0.42.2
  (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.48.5
  (crate-source "windows-targets" "0.48.5"
                "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source "windows_x86_64_gnu" "0.48.5"
                "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source "windows_x86_64_gnullvm" "0.48.5"
                "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source "windows_x86_64_msvc" "0.48.5"
                "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-winit-0.30.9
  (crate-source "winit" "0.30.9"
                "1h1wmvhfcq2lg6c6715d7pgnv85508zm94ahcfvaiv68337yl2d8"))

(define rust-winnow-0.6.20
  (crate-source "winnow" "0.6.20"
                "16y4i8z9vh8hazjxg5mvmq0c5i35wlk8rxi5gkq6cn5vlb0zxh9n"))

(define rust-winreg-0.52.0
  (crate-source "winreg" "0.52.0"
                "19gh9vp7mp1ab84kc3ag48nm9y7xgjhh3xa4vxss1gylk1rsaxx2"))

(define rust-wio-0.2.2
  (crate-source "wio" "0.2.2"
                "199p404fp96w1f1c93bf1jrvaqwypxf3hmmldhww4jk4yhr9j4jx"))

(define rust-x11-clipboard-0.9.3
  (crate-source "x11-clipboard" "0.9.3"
                "18rmsm0lrcc4hy2wqs7gn90czv59sv5bj07bbf76nfbysyrp8bb6"))

(define rust-x11-dl-2.21.0
  (crate-source "x11-dl" "2.21.0"
                "0vsiq62xpcfm0kn9zjw5c9iycvccxl22jya8wnk18lyxzqj5jwrq"))

(define rust-x11rb-0.13.1
  (crate-source "x11rb" "0.13.1"
                "04jyfm0xmc538v09pzsyr2w801yadsgvyl2p0p76hzzffg5gz4ax"))

(define rust-x11rb-protocol-0.13.1
  (crate-source "x11rb-protocol" "0.13.1"
                "0gfbxf2k7kbk577j3rjhfx7hm70kmwln6da7xyc4l2za0d2pq47c"))

(define rust-xcursor-0.3.8
  (crate-source "xcursor" "0.3.8"
                "0qazsl7h8nrbbzx84qrv39w8m2qc27g0mvrszgdls2v6n6k3vwqf"))

(define rust-xdg-2.5.2
  (crate-source "xdg" "2.5.2"
                "0im5nzmywxjgm2pmb48k0cc9hkalarz57f1d9d0x4lvb6cj76fr1"))

(define rust-xkbcommon-dl-0.4.2
  (crate-source "xkbcommon-dl" "0.4.2"
                "1iai0r3b5skd9vbr8z5b0qixiz8jblzfm778ddm8ba596a0dwffh"))

(define rust-xkeysym-0.2.1
  (crate-source "xkeysym" "0.2.1"
                "0mksx670cszyd7jln6s7dhkw11hdfv7blwwr3isq98k22ljh1k5r"))

(define rust-xml-rs-0.8.24
  (crate-source "xml-rs" "0.8.24"
                "0ck4s3j1dk4bnqam9h06nfmicnzdp69pz7y2hihlj2vrk8f3k2za"))

(define rust-yeslogic-fontconfig-sys-5.0.0
  ;; TODO: Check bundled sources.
  (crate-source "yeslogic-fontconfig-sys" "5.0.0"
                "0yiwnf2gapqaprp3icvv6b1jjh5d356vpis7pybskcd8k4wv5dpz"))

(define rust-zerocopy-0.7.35
  (crate-source "zerocopy" "0.7.35"
                "1w36q7b9il2flg0qskapgi9ymgg7p985vniqd09vi0mwib8lz6qv"))

(define rust-zerocopy-derive-0.7.35
  (crate-source "zerocopy-derive" "0.7.35"
                "0gnf2ap2y92nwdalzz3x7142f2b83sni66l39vxp2ijd6j080kzs"))

(define ssss-separator 'end-of-crates)


;;;
;;; Cargo inputs.
;;;

(define-cargo-inputs lookup-cargo-inputs
                     (alacritty =>
                                (list rust-adler2-2.0.0
                                 rust-ahash-0.8.11
                                 rust-aho-corasick-1.1.3
                                 rust-android-activity-0.6.0
                                 rust-android-properties-0.2.2
                                 rust-anstream-0.6.18
                                 rust-anstyle-1.0.10
                                 rust-anstyle-parse-0.2.6
                                 rust-anstyle-query-1.1.2
                                 rust-anstyle-wincon-3.0.6
                                 rust-arrayref-0.3.9
                                 rust-arrayvec-0.7.6
                                 rust-as-raw-xcb-connection-1.0.1
                                 rust-atomic-waker-1.1.2
                                 rust-autocfg-1.4.0
                                 rust-base64-0.22.1
                                 rust-bitflags-1.3.2
                                 rust-bitflags-2.6.0
                                 rust-block-0.1.6
                                 rust-block2-0.5.1
                                 rust-bumpalo-3.16.0
                                 rust-bytemuck-1.20.0
                                 rust-bytes-1.9.0
                                 rust-calloop-0.13.0
                                 rust-calloop-wayland-source-0.3.0
                                 rust-cc-1.2.4
                                 rust-cesu8-1.1.0
                                 rust-cfg-if-1.0.0
                                 rust-cfg-aliases-0.2.1
                                 rust-cgl-0.3.2
                                 rust-clap-4.5.23
                                 rust-clap-builder-4.5.23
                                 rust-clap-complete-4.5.38
                                 rust-clap-derive-4.5.18
                                 rust-clap-lex-0.7.4
                                 rust-clipboard-win-3.1.1
                                 rust-cocoa-0.25.0
                                 rust-cocoa-foundation-0.1.2
                                 rust-colorchoice-1.0.3
                                 rust-combine-4.6.7
                                 rust-concurrent-queue-2.5.0
                                 rust-copypasta-0.10.1
                                 rust-core-foundation-0.9.4
                                 rust-core-foundation-sys-0.8.7
                                 rust-core-graphics-0.23.2
                                 rust-core-graphics-types-0.1.3
                                 rust-core-text-20.1.0
                                 rust-crc32fast-1.4.2
                                 rust-crossbeam-channel-0.5.13
                                 rust-crossbeam-utils-0.8.20
                                 rust-crossfont-0.8.0
                                 rust-cstr-0.2.12
                                 rust-cursor-icon-1.1.0
                                 rust-dirs-5.0.1
                                 rust-dirs-sys-0.4.1
                                 rust-dispatch-0.2.0
                                 rust-dlib-0.5.2
                                 rust-downcast-rs-1.2.1
                                 rust-dpi-0.1.1
                                 rust-dwrote-0.11.2
                                 rust-embed-resource-2.5.1
                                 rust-equivalent-1.0.1
                                 rust-errno-0.3.10
                                 rust-fastrand-2.3.0
                                 rust-fdeflate-0.3.7
                                 rust-filetime-0.2.25
                                 rust-flate2-1.0.35
                                 rust-foreign-types-0.5.0
                                 rust-foreign-types-macros-0.2.3
                                 rust-foreign-types-shared-0.3.1
                                 rust-freetype-rs-0.36.0
                                 rust-freetype-sys-0.20.1
                                 rust-fsevent-sys-4.1.0
                                 rust-futures-io-0.3.31
                                 rust-gethostname-0.4.3
                                 rust-getrandom-0.2.15
                                 rust-gl-generator-0.14.0
                                 rust-glutin-0.32.2
                                 rust-glutin-egl-sys-0.7.1
                                 rust-glutin-glx-sys-0.6.1
                                 rust-glutin-wgl-sys-0.6.1
                                 rust-hashbrown-0.15.2
                                 rust-heck-0.5.0
                                 rust-hermit-abi-0.4.0
                                 rust-home-0.5.9
                                 rust-indexmap-2.7.0
                                 rust-inotify-0.9.6
                                 rust-inotify-sys-0.1.5
                                 rust-is-terminal-polyfill-1.70.1
                                 rust-itoa-1.0.14
                                 rust-jni-0.21.1
                                 rust-jni-sys-0.3.0
                                 rust-jobserver-0.1.32
                                 rust-js-sys-0.3.76
                                 rust-khronos-api-3.1.0
                                 rust-kqueue-1.0.8
                                 rust-kqueue-sys-1.0.4
                                 rust-lazy-bytes-cast-5.0.1
                                 rust-lazy-static-1.5.0
                                 rust-libc-0.2.168
                                 rust-libloading-0.8.6
                                 rust-libredox-0.1.3
                                 rust-linux-raw-sys-0.4.14
                                 rust-lock-api-0.4.12
                                 rust-log-0.4.22
                                 rust-malloc-buf-0.0.6
                                 rust-memchr-2.7.4
                                 rust-memmap2-0.9.5
                                 rust-memoffset-0.9.0
                                 rust-miniz-oxide-0.8.0
                                 rust-mio-0.8.11
                                 rust-miow-0.6.0
                                 rust-ndk-0.9.0
                                 rust-ndk-context-0.1.1
                                 rust-ndk-sys-0.6.0+11769913
                                 rust-notify-6.1.1
                                 rust-num-enum-0.7.3
                                 rust-num-enum-derive-0.7.3
                                 rust-objc-0.2.7
                                 rust-objc-foundation-0.1.1
                                 rust-objc-sys-0.3.5
                                 rust-objc2-0.5.2
                                 rust-objc2-app-kit-0.2.2
                                 rust-objc2-cloud-kit-0.2.2
                                 rust-objc2-contacts-0.2.2
                                 rust-objc2-core-data-0.2.2
                                 rust-objc2-core-image-0.2.2
                                 rust-objc2-core-location-0.2.2
                                 rust-objc2-encode-4.0.3
                                 rust-objc2-foundation-0.2.2
                                 rust-objc2-link-presentation-0.2.2
                                 rust-objc2-metal-0.2.2
                                 rust-objc2-quartz-core-0.2.2
                                 rust-objc2-symbols-0.2.2
                                 rust-objc2-ui-kit-0.2.2
                                 rust-objc2-uniform-type-identifiers-0.2.2
                                 rust-objc2-user-notifications-0.2.2
                                 rust-objc-id-0.1.1
                                 rust-once-cell-1.20.2
                                 rust-option-ext-0.2.0
                                 rust-orbclient-0.3.48
                                 rust-parking-lot-0.12.3
                                 rust-parking-lot-core-0.9.10
                                 rust-percent-encoding-2.3.1
                                 rust-pin-project-1.1.7
                                 rust-pin-project-internal-1.1.7
                                 rust-pin-project-lite-0.2.15
                                 rust-piper-0.2.4
                                 rust-pkg-config-0.3.31
                                 rust-png-0.17.15
                                 rust-polling-3.7.4
                                 rust-proc-macro-crate-3.2.0
                                 rust-proc-macro2-1.0.92
                                 rust-quick-xml-0.36.2
                                 rust-quote-1.0.37
                                 rust-raw-window-handle-0.6.2
                                 rust-redox-syscall-0.4.1
                                 rust-redox-syscall-0.5.8
                                 rust-redox-users-0.4.6
                                 rust-regex-automata-0.4.9
                                 rust-regex-syntax-0.8.5
                                 rust-rustc-version-0.4.1
                                 rust-rustix-0.38.42
                                 rust-rustix-openpty-0.1.1
                                 rust-ryu-1.0.18
                                 rust-same-file-1.0.6
                                 rust-scoped-tls-1.0.1
                                 rust-scopeguard-1.2.0
                                 rust-sctk-adwaita-0.10.1
                                 rust-semver-1.0.24
                                 rust-serde-1.0.216
                                 rust-serde-derive-1.0.216
                                 rust-serde-json-1.0.133
                                 rust-serde-spanned-0.6.8
                                 rust-serde-yaml-0.9.34+deprecated
                                 rust-shlex-1.3.0
                                 rust-signal-hook-0.3.17
                                 rust-signal-hook-registry-1.4.2
                                 rust-simd-adler32-0.3.7
                                 rust-slab-0.4.9
                                 rust-smallvec-1.13.2
                                 rust-smithay-client-toolkit-0.19.2
                                 rust-smithay-clipboard-0.7.2
                                 rust-smol-str-0.2.2
                                 rust-strict-num-0.1.1
                                 rust-strsim-0.11.1
                                 rust-syn-2.0.90
                                 rust-tempfile-3.14.0
                                 rust-thiserror-1.0.69
                                 rust-thiserror-impl-1.0.69
                                 rust-tiny-skia-0.11.4
                                 rust-tiny-skia-path-0.11.4
                                 rust-toml-0.8.19
                                 rust-toml-datetime-0.6.8
                                 rust-toml-edit-0.22.22
                                 rust-tracing-0.1.41
                                 rust-tracing-core-0.1.33
                                 rust-unicode-ident-1.0.14
                                 rust-unicode-segmentation-1.12.0
                                 rust-unicode-width-0.1.14
                                 rust-unsafe-libyaml-0.2.11
                                 rust-utf8parse-0.2.2
                                 rust-version-check-0.9.5
                                 rust-vswhom-0.1.0
                                 rust-vswhom-sys-0.1.2
                                 rust-vte-graphics-0.13.1
                                 rust-vte-generate-state-changes-0.1.2
                                 rust-walkdir-2.5.0
                                 rust-wasi-0.11.0+wasi-snapshot-preview1
                                 rust-wasm-bindgen-0.2.99
                                 rust-wasm-bindgen-backend-0.2.99
                                 rust-wasm-bindgen-futures-0.4.49
                                 rust-wasm-bindgen-macro-0.2.99
                                 rust-wasm-bindgen-macro-support-0.2.99
                                 rust-wasm-bindgen-shared-0.2.99
                                 rust-wayland-backend-0.3.7
                                 rust-wayland-client-0.31.7
                                 rust-wayland-csd-frame-0.3.0
                                 rust-wayland-cursor-0.31.7
                                 rust-wayland-protocols-0.32.5
                                 rust-wayland-protocols-plasma-0.3.5
                                 rust-wayland-protocols-wlr-0.3.5
                                 rust-wayland-scanner-0.31.5
                                 rust-wayland-sys-0.31.5
                                 rust-web-sys-0.3.76
                                 rust-web-time-1.1.0
                                 rust-winapi-0.3.9
                                 rust-winapi-i686-pc-windows-gnu-0.4.0
                                 rust-winapi-util-0.1.9
                                 rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                 rust-windows-sys-0.45.0
                                 rust-windows-sys-0.48.0
                                 rust-windows-sys-0.52.0
                                 rust-windows-sys-0.59.0
                                 rust-windows-targets-0.42.2
                                 rust-windows-targets-0.48.5
                                 rust-windows-targets-0.52.6
                                 rust-windows-aarch64-gnullvm-0.42.2
                                 rust-windows-aarch64-gnullvm-0.48.5
                                 rust-windows-aarch64-gnullvm-0.52.6
                                 rust-windows-aarch64-msvc-0.42.2
                                 rust-windows-aarch64-msvc-0.48.5
                                 rust-windows-aarch64-msvc-0.52.6
                                 rust-windows-i686-gnu-0.42.2
                                 rust-windows-i686-gnu-0.48.5
                                 rust-windows-i686-gnu-0.52.6
                                 rust-windows-i686-gnullvm-0.52.6
                                 rust-windows-i686-msvc-0.42.2
                                 rust-windows-i686-msvc-0.48.5
                                 rust-windows-i686-msvc-0.52.6
                                 rust-windows-x86-64-gnu-0.42.2
                                 rust-windows-x86-64-gnu-0.48.5
                                 rust-windows-x86-64-gnu-0.52.6
                                 rust-windows-x86-64-gnullvm-0.42.2
                                 rust-windows-x86-64-gnullvm-0.48.5
                                 rust-windows-x86-64-gnullvm-0.52.6
                                 rust-windows-x86-64-msvc-0.42.2
                                 rust-windows-x86-64-msvc-0.48.5
                                 rust-windows-x86-64-msvc-0.52.6
                                 rust-winit-0.30.9
                                 rust-winnow-0.6.20
                                 rust-winreg-0.52.0
                                 rust-wio-0.2.2
                                 rust-x11-clipboard-0.9.3
                                 rust-x11-dl-2.21.0
                                 rust-x11rb-0.13.1
                                 rust-x11rb-protocol-0.13.1
                                 rust-xcursor-0.3.8
                                 rust-xdg-2.5.2
                                 rust-xkbcommon-dl-0.4.2
                                 rust-xkeysym-0.2.1
                                 rust-xml-rs-0.8.24
                                 rust-yeslogic-fontconfig-sys-5.0.0
                                 rust-zerocopy-0.7.35
                                 rust-zerocopy-derive-0.7.35)))

(define-cargo-inputs lookup-cargo-inputs)
