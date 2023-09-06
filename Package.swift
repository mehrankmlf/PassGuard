// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

//  Package.swift
//  SecurityKit
//
//  Created by MehranKamalifard
//  Copyright © 2023 Mehran Kamalifard.  All rights reserved.
//

import PackageDescription

let package = Package(
    name: "PassGuard",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],

    products: [.library(name: "PassGuard", targets: ["PassGuard"])],
    targets: [
        .target(
            name: "PassGuard",
            path: "PassGuard/PassGuard",
            exclude: ["PassGuard.docc"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
