// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
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
            name: "HomePresentation",
            dependencies: [
                "HomeDomain"
            ]
        ),
        .target(
            name: "HomeFeature",
            dependencies: [
                "HomeDomain",
                "HomeData",
                "HomePresentation"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
