// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyDesignSystem",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "MyDesignSystem",
            targets: ["MyDesignSystem"]
        ),
        .executable(
            name: "MyDesignSystemClient", 
            targets: ["MyDesignSystemClient"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0")
    ],
    targets: [
        .target(
            name: "MyDesignSystem",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke")
            ],
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        ),
        .executableTarget(
            name: "MyDesignSystemClient",
            dependencies: [
                .target(name: "MyDesignSystem")
            ]
        )
    ]
)
