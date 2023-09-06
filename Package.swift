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
    platforms: [.iOS(.v13)],

    products: [.library(name: "PassGuard", 
		targets: ["PassGuard"])],

    dependencies: [
        // Dependencies declare other packages that this package depends on.
       .package(name: "PassGuard", url: "https://github.com/mehrankmlf/PassGuard.git", .upToNextMajor(from: "1.0.7")),
    ],

    targets: [
        .target(
            name: "PassGuard",
            path: "PassGuard/PassGuard",
        )
    ],
    swiftLanguageVersions: [.v5]
)
