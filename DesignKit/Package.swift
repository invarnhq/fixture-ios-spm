// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "Screens", targets: ["Screens"]),
    ],
    dependencies: [
        // One small external dependency on purpose: templates that exercise
        // SwiftPM dependency resolution need a real fetch from github.com.
        .package(url: "https://github.com/apple/swift-numerics.git", exact: "1.1.1"),
    ],
    targets: [
        .target(
            name: "Screens",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics"),
            ]
        ),
    ]
)
