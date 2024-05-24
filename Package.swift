// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "RealmDebugger",
    products: [
        .library(
            name: "RealmDebugger",
            targets: ["RealmDebugger"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.50.1"))
    ],
    targets: [
        .target(
            name: "RealmDebugger",
            dependencies: [
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "RealmDebuggerTests",
            dependencies: ["RealmDebugger"]
        ),
    ]
)
