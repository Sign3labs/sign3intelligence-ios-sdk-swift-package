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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1006%2FSign3Intelligence.xcframework.zip?alt=media&token=8976ed6c-f02f-439b-82fc-5906ba3f3776",
            checksum: "2486c621a510bde4179983c45fa7edf0dbceec3df05bbdfbf041cdfa414d4661"
        )
    ]
)
