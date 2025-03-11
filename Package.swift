// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1015"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "9265d075fb5cc00cf44db00474ee5195f78a8a1491a4c7225cc1d0983e0064e7"
        )
    ]
)
