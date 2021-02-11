// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCore",
    platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "AppCore", targets: ["AppCore"])
    ],
    dependencies: [
        .package(name: "SwiftRex", url: "https://github.com/SwiftRex/SwiftRex.git", .upToNextMajor(from: "0.8.2")),
        .package(path: "AppLifecycle"),
        .package(path: "Counter"),
        .package(path: "ShakeGesture")
    ],
    targets: [
        .target(name: "AppCore", dependencies: [.product(name: "CombineRex", package: "SwiftRex"), "AppLifecycle", "Counter", "ShakeGesture"])
    ]
)
