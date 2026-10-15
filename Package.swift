// swift-tools-version: 5.7.1
import PackageDescription

let package = Package(
    name: "VoWAN",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "VoWAN",
            dependencies: [
                .product(name: "NIO", package: "swift-nio")
            ]
        )
    ]
)
