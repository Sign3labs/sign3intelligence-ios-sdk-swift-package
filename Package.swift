// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.2"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v0.0.1028/Sign3Intelligence.xcframework.zip",
            checksum: "75866417724d05b40fdb4391ebaded76b89d74c7a87d9e40ac95d12023044ab0"
        )
    ]
)
