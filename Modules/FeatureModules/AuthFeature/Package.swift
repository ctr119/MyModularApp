// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "AuthFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "AuthFeature", targets: ["AuthFeature"]),
    ],
    dependencies: [
        .package(path: "../../CoreModules/NetworkKit"),
        .package(path: "../../CoreModules/PersistanceKit"),
    ],
    targets: [
        .target(
            name: "AuthFeature",
            dependencies: [
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "PersistanceKit", package: "PersistanceKit")
            ],
            path: "Sources/AuthFeature"
        ),
    ],
    swiftLanguageModes: [.v6]
)
