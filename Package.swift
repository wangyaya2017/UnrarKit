// swift-tools-version: 5.6a

import PackageDescription

let package = Package(
    name: "UnrarKit",
    defaultLocalization: "en",
    products: [
        .library(
            name: "UnrarKit",
            targets: ["UnrarKit"]),
    ],
    targets: [
        .target(
            name: "UnrarKit",
            dependencies: ["unrar-lib"],
            path: "Classes",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Categories"),
                .headerSearchPath("../Libraries/unrar"),
                .headerSearchPath("../../Libraries/unrar"),
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Categories"),
                .headerSearchPath("../Libraries/unrar"),
                .headerSearchPath("../../Libraries/unrar"),
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]),
        .target(
            name: "unrar-lib",
            dependencies: [],
            path: "Libraries/unrar",
            sources: [
                "rar.cpp",
                "strlist.cpp",
                "strfn.cpp",
                "pathfn.cpp",
                "smallfn.cpp",
                "global.cpp",
                "file.cpp",
                "filefn.cpp",
                "filcreat.cpp",
                "archive.cpp",
                "arcread.cpp",
                "unicode.cpp",
                "system.cpp",
                // "isnt.cpp", // 保持注释掉，避免 Windows 特定代码
                "crypt.cpp",
                "crc.cpp",
                "rawread.cpp",
                "encname.cpp",
                "resource.cpp",
                "match.cpp",
                "timefn.cpp",
                "rdwrfn.cpp",
                "consio.cpp",
                "options.cpp",
                "errhnd.cpp",
                "rarvm.cpp",
                "secpassword.cpp",
                "rijndael.cpp",
                "getbits.cpp",
                "sha1.cpp",
                "sha256.cpp",
                "blake2s.cpp",
                "hash.cpp",
                "extinfo.cpp",
                "extract.cpp",
                "volume.cpp",
                "find.cpp",
                "unpack.cpp",
                "headers.cpp",
                "threadpool.cpp",
                "rs16.cpp",
                "cmddata.cpp",
                "ui.cpp",
                "filestr.cpp",
                "recvol.cpp",
                "rs.cpp",
                "scantree.cpp",
                "qopen.cpp",
                "dll.cpp"
            ],
            // 暴露必要的头文件给其他 target
            publicHeadersPath: ".",
            cSettings: [
                .unsafeFlags([
                    "-Wno-return-type",
                    "-Wno-logical-op-parentheses",
                    "-Wno-conversion",
                    "-Wno-parentheses",
                    "-Wno-unused-function",
                    "-Wno-unused-variable",
                    "-Wno-switch",
                    "-Wno-unused-command-line-argument",
                    "-Wno-strict-prototypes",
                    "-Wno-conditional-uninitialized"
                ]),
                .headerSearchPath("."),
                .headerSearchPath("../Classes") // 添加对 Classes 目录的搜索路径
            ],
            cxxSettings: [
                .define("SILENT"),
                .define("RARDLL"),
                .define("_UNIX"), // 添加 Unix 平台定义
                .define("_APPLE"), // 添加 Apple 平台定义
                .headerSearchPath("."),
                .headerSearchPath("../Classes") // 添加对 Classes 目录的搜索路径
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]),
    ]
)
