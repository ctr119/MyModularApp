// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "HomeFeature", targets: ["HomeBuilder"]),
    ],
    dependencies: [
        .package(path: "../../CoreModules/NetworkKit")
    ],
    targets: [
        .target(name: "HomeDomain"),
        .target(
            name: "HomeData",
            dependencies: [
                "HomeDomain",
                .product(name: "NetworkKit", package: "NetworkKit")
            ]
        ),
        .target(
            name: "HomeUI",
            dependencies: [
                "HomeDomain"
            ]
        ),
        .target(
            name: "HomeBuilder",
            dependencies: [
                "HomeDomain",
                "HomeData",
                "HomeUI"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
