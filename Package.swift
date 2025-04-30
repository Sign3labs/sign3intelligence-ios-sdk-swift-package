// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.5"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v0.0.1029/Sign3Intelligence.xcframework.zip",
            checksum: "1902d13244f0de98e8604494c7203247a6093cd811f45cf8819ae9fad0e7d5b0"
        )
    ]
)
