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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1004%2FSign3Intelligence.xcframework.zip?alt=media&token=84c89daf-89c8-463f-b609-1304b9e2e05e",
            checksum: "005c4e4294c62f314ef80f6da9ab89f3f940d7b39600a64e6ae660c69cde9556"
        )
    ]
)
