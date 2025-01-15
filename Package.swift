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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1003%2FSign3Intelligence.xcframework.zip?alt=media&token=1bf4155e-3e3e-42a7-b320-7c53a2af058d",
            checksum: "a66022ef1111e9cc1f50416b86e0e2fba2efefb5e2e8eab4b39d91da6330c47a"
        )
    ]
)
