// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.1.2"
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
            checksum: "a5480d25ec52a081ba8f1c8934cb851375fd6809b6c14150782ce6e61fb89f6b"
        )
    ]
)
