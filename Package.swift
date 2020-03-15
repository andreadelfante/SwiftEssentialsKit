// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftEssentialsKit",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "SwiftEssentialsKit",
            targets: [
                "SwiftEssentialsKit/PackageDTO",
                "SwiftEssentialsKit/AlertControllerBuilder",
                "SwiftEssentialsKit/Convenient"
            ]),
        .library(
            name: "SwiftEssentialsKit/PackageDTO",
            targets: ["SwiftEssentialsKit/PackageDTO"]),
        .library(
            name: "SwiftEssentialsKit/AlertControllerBuilder",
            targets: ["SwiftEssentialsKit/AlertControllerBuilder"]),
        .library(
            name: "SwiftEssentialsKit/Convenient",
            targets: ["SwiftEssentialsKit/Convenient"]),
        .library(
            name: "SwiftEssentialsKit/UI",
            targets: ["SwiftEssentialsKit/UI"])
    ],
    dependencies: [
        .package(url: "https://github.com/patchthecode/JTAppleCalendar.git", from: "8.0.0"),
        .package(url: "https://github.com/mac-cain13/R.swift.Library.git", from: "5.1.0"),

        // Test dependencies
        //.package(url: "https://github.com/vadymmarkov/Fakery.git", from: "4.1.1")
    ],
    targets: [
        .target(
            name: "SwiftEssentialsKit/PackageDTO",
            dependencies: [],
            path: "SwiftEssentialsKit/PackageDTO"),
        .target(
            name: "SwiftEssentialsKit/AlertControllerBuilder",
            dependencies: [],
            path: "SwiftEssentialsKit/AlertControllerBuilder"),
        .target(
            name: "SwiftEssentialsKit/Convenient",
            dependencies: [],
            path: "SwiftEssentialsKit/Convenient"),
        .target(
            name: "SwiftEssentialsKit/UI",
            dependencies: [
                "SwiftEssentialsKit/PackageDTO",
                "SwiftEssentialsKit/Convenient",
                "JTAppleCalendar",
                "Rswift"
            ],
            path: "SwiftEssentialsKit/UI"),

/*
        .testTarget(
            name: "SwiftEssentialsKitTests",
            dependencies: [
                "SwiftEssentialsKit/PackageDTO",
                "SwiftEssentialsKit/AlertControllerBuilder",
                "SwiftEssentialsKit/Convenient",
                "SwiftEssentialsKit/UI",
                "Fakery"
            ],
            path: "Example/Tests"),
            */
    ],
    swiftLanguageVersions: [.v5]
)
