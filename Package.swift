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
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OEXFoundation",
            targets: ["OEXFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.8.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", exact: "7.9.1"),
        .package(url: "https://github.com/siteline/swiftui-introspect", from: "1.3.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OEXFoundation",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "Swinject", package: "Swinject")
            ]
        ),
        .testTarget(
            name: "OEXFoundationTests",
            dependencies: ["OEXFoundation"]
        )
    ]
)
