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
            url: "https://firebasestorage.googleapis.com/v0/b/clean-pdf-sacnner.appspot.com/o/Sign3Intelligenc[…]?alt=media&token=ef9e5c81-6799-4a25-9158-4e6cab87637c",
            checksum: "ab2733ac1dea70595c39dbc8e4cf742ada61b6928647531559d26cd2145c2bbe"
        )
    ]
)
