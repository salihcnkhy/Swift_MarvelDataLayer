// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarvelDataLayer",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MarvelDataLayer",
            targets: ["MarvelDataLayer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/salihcnkhy/Swift_DataLayerBase.git", .branch("master")),
        .package(url: "https://github.com/salihcnkhy/Swift_MarvelDomainLayer.git", .branch("master")),
        .package(url: "https://github.com/salihcnkhy/NetworkLayer.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MarvelDataLayer",
            dependencies: [
                .product(name: "DataLayerBase", package: "Swift_DataLayerBase"),
                .product(name: "MarvelDomainLayer", package: "Swift_MarvelDomainLayer"),
                .product(name: "NetworkLayer", package: "NetworkLayer")
                
            ]),
        .testTarget(
            name: "MarvelDataLayerTests",
            dependencies: ["MarvelDataLayer"]),
    ]
)
