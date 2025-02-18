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
            url: "https://firebasestorage.googleapis.com/v0/b/make-friends-7338f.appspot.com/o/test-intelligence-iOS%2F0.0.1007%2FSign3Intelligence.xcframework.zip?alt=media&token=783e74d2-c078-4232-890a-162c309eee90",
            checksum: "5564b6f5412dd0ab6cb3eb825387afcab34b3619db454cc9cab81c93573fb02f"
        )
    ]
)
