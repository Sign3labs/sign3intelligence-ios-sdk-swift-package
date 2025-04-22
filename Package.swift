// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1025"
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
            checksum: "15f6d96800abff34abfd0e32468ea3acd730cf4ccd20be7b3651513a0ebe5a0b"
        )
    ]
)
