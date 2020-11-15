// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Components",
            targets: ["Components"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1")
    ],
    targets: [
        .target(
            name: "Components",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift")
                ]),
        .testTarget(
            name: "ComponentsTests",
            dependencies: ["Components"]),
    ]
)
