// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OEXFoundation",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "OEXFoundation",
            type: .dynamic,
            targets: ["OEXFoundation"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.10.1"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", exact: "8.1.0"),
        .package(url: "https://github.com/siteline/swiftui-introspect", exact: "1.3.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.9.1"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.57.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", exact: "24.0.0")
    ],
    targets: [
        .target(
            name: "OEXFoundation",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "Swinject", package: "Swinject"),
                .product(name: "KeychainSwift", package: "keychain-swift")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .testTarget(
            name: "OEXFoundationTests",
            dependencies: ["OEXFoundation"]
        )
    ]
)
