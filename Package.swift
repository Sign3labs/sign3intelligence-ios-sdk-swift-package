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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1003%2FSign3Intelligence.xcframework.zip?alt=media&token=6c1ee01d-aad9-46c1-a71c-e9bfc8ec72b2",
            checksum: "995583ca1284c633924eda3ecfe8fa4ba7657ac2ff76309ca5f3d9f007c455fa"
        )
    ]
)
