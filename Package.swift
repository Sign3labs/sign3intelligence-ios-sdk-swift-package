// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1010"
let package = Package(
    name: "sign3intelligence-ios-sdk-swift-package",
    products: [
        .library(
            name: "sign3intelligence-ios-sdk-swift-package",
            targets: ["sign3intelligence-ios-sdk-swift-package"]),
    ],
    targets: [
        .binaryTarget(
            name: "sign3intelligence-ios-sdk-swift-package",
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v0.0.1012/Sign3Intelligence.xcframework.zip",
            checksum: "f63181c4af20a2a07ad05987ba2d18c7142bfcd33b34af5f06074baf628e99bb"
        )
    ]
)
