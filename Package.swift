// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.9"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/intelligence/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "c514d3b94315556b2d9b60511f1a49821fc5c3313658fa3d1deec99c7fc7a6ab"
        )
    ]
)
