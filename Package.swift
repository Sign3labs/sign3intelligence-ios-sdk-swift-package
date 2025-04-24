// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1026"
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
            checksum: "a0cb9377650da4224a73aa530fc47f925cbd26ed50ec64e0f0f712f4dbdaf414"
        )
    ]
)
