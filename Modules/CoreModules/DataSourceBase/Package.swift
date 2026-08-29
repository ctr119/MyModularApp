// swift-tools-version: 6.3
import PackageDescription

let package = Package(
    name: "DataSourceBase",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "DataSourceBase",
            targets: ["DataSourceBase"]
        ),
    ],
    targets: [
        .target(
            name: "DataSourceBase"
        ),
    ],
    swiftLanguageModes: [.v6]
)
