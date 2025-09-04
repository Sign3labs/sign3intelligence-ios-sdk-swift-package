// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let version = "0.0.1032"
let package = Package(
    name: "Sign3Intelligence",
    products: [
        .library(
            name: "Sign3Intelligence",
            targets: ["Sign3Intelligence"]),
    ],
    targets: [
        .binaryTarget(
            name: "Sign3Intelligence",
            url: "https://cdn.sign3.in/mobile-sdk/ios/test/v\(version)/Sign3Intelligence.xcframework.zip",
            checksum: "87f3db20c208cab5cd3d5259e30972ba0cba61546a4cf080fb4ea94421c32a49"
        )
    ]
)
