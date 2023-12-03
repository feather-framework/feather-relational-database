// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-sql-database",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "FeatherRelationalDatabase", targets: ["FeatherRelationalDatabase"]),
        .library(name: "XCTFeatherRelationalDatabase", targets: ["XCTFeatherRelationalDatabase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-service", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
        .package(url: "https://github.com/vapor/sql-kit", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "FeatherRelationalDatabase",
            dependencies: [
                .product(name: "FeatherService", package: "feather-service"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "SQLKit", package: "sql-kit"),
            ]
        ),
        .target(
            name: "XCTFeatherRelationalDatabase",
            dependencies: [
                .target(name: "FeatherRelationalDatabase"),
            ]
        ),
        .testTarget(
            name: "FeatherRelationalDatabaseTests",
            dependencies: [
                .target(name: "FeatherRelationalDatabase"),
            ]
        ),
        .testTarget(
            name: "XCTFeatherRelationalDatabaseTests",
            dependencies: [
                .target(name: "XCTFeatherRelationalDatabase"),
            ]
        ),
    ]
)
