// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.4"
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
            checksum: "e4a4aa67bf064a3d75332d419bd7c50b4f48526e0f7a141465db0eab33c83001"
        )
    ]
)
