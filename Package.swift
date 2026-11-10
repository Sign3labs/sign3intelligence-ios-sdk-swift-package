// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
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
//            url: "https://cdn.sign3.in/mobile-sdk/ios/test/intelligence/v0.0.1000/Sign3Intelligence.xcframework.zip",
//            checksum: "1e779d2af62abc03341873c569620fb42619ca763e8129a3ab2ebad79fb7cd0a"
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/intelligence/v0.0.2002/Sign3Intelligence.xcframework.zip",
            checksum: "333cc749f3ebaaad9cdf134f7380e82515478531d4d3cd0f7abd7b7fa9565a35"
        )
    ]
)
