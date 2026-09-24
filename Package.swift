// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1000"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/intelligence/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "1e779d2af62abc03341873c569620fb42619ca763e8129a3ab2ebad79fb7cd0a"
        )
    ]
)
