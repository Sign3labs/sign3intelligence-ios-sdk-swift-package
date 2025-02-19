// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1008%2FSign3Intelligence.xcframework.zip?alt=media&token=30e53aac-690d-4d9b-91df-9cef5c28a7e0",
            checksum: "41796f974cee8c242b4f38da27cf28ca8c9ab52019d6ff2ab7954dc25bb8f986"
        )
    ]
)
