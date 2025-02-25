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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1009%2FSign3Intelligence.xcframework.zip?alt=media&token=48222ada-77f0-4b0b-8742-e6876f0aad02",
            checksum: "f63181c4af20a2a07ad05987ba2d18c7142bfcd33b34af5f06074baf628e99bb"
        )
    ]
)
