// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "2018",
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "2018",
            dependencies: ["SwiftCLI"]
        ),
        .testTarget(
            name: "2018Tests",
            dependencies: ["2018"]
        ),
    ]
)
