// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1020"
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
            checksum: "a9fc948d8a6c62e6497fcd9d3b6a51bd5da3e42066dbd3b30c0b9e9b236ab95f"
        )
    ]
)
