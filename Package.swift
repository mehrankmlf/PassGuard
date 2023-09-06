// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PassGuard",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "PassGuard",
            targets: ["PassGuard"]),
    ],
    targets: [
        .target(
            name: "PassGuard",
            path: "PassGuard/PassGuard"
        )
    ],
    swiftLanguageVersions: [.v5]
)
