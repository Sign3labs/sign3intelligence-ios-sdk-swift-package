// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.1.3"
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
            checksum: "9b9c54beda952300deb247fa593a9f7f52b5f6df5ae5eff1ff24df7e08dd0388"
        )
    ]
)
