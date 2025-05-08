// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.6"
let package = Package(
    name: "Sign3Intelligence",
    products: [
        .library(
            name: "Sign3Intelligence",
            targets: ["Sign3Intelligence"]),
    ],
    targets: [
        .binaryTarget(
            name: "Sign3Intelligence",
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v0.0.1030/Sign3Intelligence.xcframework.zip",
            checksum: "6432dfbb98617d1d7fbdfe16ef7ed32ec77595dd4ac2fd37e9c1c7426f1f38ac"
        )
    ]
)
