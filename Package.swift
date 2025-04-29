// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.1"
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
            checksum: "702639e34df0c617cf4dc8687beeca61ff5915a52640479f21d98b920bb5521d"
        )
    ]
)
