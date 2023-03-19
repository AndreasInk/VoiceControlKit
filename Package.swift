// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VoiceControlKit",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VoiceControlKit",
            targets: ["VoiceControlKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/AndreasInk/whisperspm", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VoiceControlKit",
            dependencies: [.product(name: "whisper", package: "whisperspm")],
            resources: [.process("models/ggml-small.bin")]),
        .testTarget(
            name: "VoiceControlKitTests",
            dependencies: ["VoiceControlKit"]),
    ]
)
