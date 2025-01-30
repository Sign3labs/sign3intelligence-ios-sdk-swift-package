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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1005%2FSign3Intelligence.xcframework.zip?alt=media&token=41a539f7-237f-43c2-9038-dd8b60174f1a",
            checksum: "e7aef073e1a138d06d2c0a59acf074d31a94af4f9cda515aa431dc8861e203aa"
        )
    ]
)
