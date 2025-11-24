// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "1.1.1"
let package = Package(
    name: "IdentityFraud",
    products: [
        .library(
            name: "IdentityFraud",
            targets: ["IdentityFraud"]),
    ],
    targets: [
        .binaryTarget(
            name: "IdentityFraud",
            url: "https://cdn.sign3.in/mobile-sdk/ios/intelligence/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "c9e056fbae85ab209fffb9b02251c1fb8ed1ce8149978c04eeb8e3783a542faa"
        )
    ]
)
