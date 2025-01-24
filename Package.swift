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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1003%2FSign3Intelligence.xcframework.zip?alt=media&token=9ba816ad-0dbf-4015-9689-1ccd58702ac8",
            checksum: "06454bd73606bef18698aa87333292d92f2d99894242f4e1d74daa18a39527b9"
        )
    ]
)
