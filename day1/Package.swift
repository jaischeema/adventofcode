// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Captcha",
    dependencies: [
    ],
    targets: [
        .target(
            name: "Captcha",
            dependencies: []),

        .testTarget(
            name: "CaptchaTests",
            dependencies: ["Captcha"]),
    ]
)
