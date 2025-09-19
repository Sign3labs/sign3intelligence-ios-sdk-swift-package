// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.0.11"
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
            url: "https://cdn.sign3.in/mobile-sdk/ios/intelligence/v.\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "be8f10fdfdf5da22d0d17b30f65e1b5fce1ae3a26869ccd8012e8f2ce92ba12a"
        )
    ]
)
