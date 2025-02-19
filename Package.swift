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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1007%2FSign3Intelligence.xcframework.zip?alt=media&token=93743c84-a9a9-412f-9a40-bf6627a64152",
            checksum: "a860aa9ece7e71e3e0c8f967999d07b23cef0cf8546a00ebccc39cb2b31afc86"
        )
    ]
)
