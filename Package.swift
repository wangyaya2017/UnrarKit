// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GCDWebServer",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "GCDWebServer",
            targets: ["GCDWebServer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GCDWebServer",
            path: ".",
            exclude: [
                "Demo",
                "Tests",
                "Mac",
                "tvOS",
                "GCDWebServer.podspec",
                "LICENSE",
                "README.md",
                "Run-Tests.sh",
                "format-code.sh",
                "release-package.sh"
            ],
            sources: [
                "GCDWebServer",
                "GCDWebUploader",
                "GCDWebDAVServer"
            ],
            publicHeadersPath: "GCDWebServer/Core",
            cSettings: [
                .headerSearchPath("GCDWebServer/Requests"),
                .headerSearchPath("GCDWebServer/Responses"),
                .headerSearchPath("GCDWebUploader"),
                .headerSearchPath("GCDWebDAVServer")
            ]
        )
    ]
)
