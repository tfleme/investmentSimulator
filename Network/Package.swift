// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1")
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift")
            ]),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"]),
    ]
)
