// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1039"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "a09fb847234c7c6494d482eba53b4d8320c0fd7fe39226695f9f41da08e134eb"
        )
    ]
)
