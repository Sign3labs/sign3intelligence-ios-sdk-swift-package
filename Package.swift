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
            url: "https://cdn.sign3.in/mobile-sdk/ios/v\(version).zip",
            checksum: "9jGBxK8goqB60FmHui0YxxQr/NM7NK9fBgdLr2KOmbs="
        )
    ]
)
