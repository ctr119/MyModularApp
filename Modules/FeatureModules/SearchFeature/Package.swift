// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SearchFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "SearchFeature", targets: ["SearchFeature"]),
        // For Previews to work
        .library(name: "SearchPresentation", type: .dynamic, targets: ["SearchPresentation"]),
    ],
    dependencies: [
        .package(path: "../../CoreModules/DataSourceBase")
    ],
    targets: [
        .target(name: "SearchDomain"),
        .target(name: "SearchData", dependencies: [
            "SearchDomain",
            .product(name: "DataSourceBase", package: "DataSourceBase")
        ]),
        .target(name: "SearchPresentation", dependencies: [
            "SearchDomain"
        ]),
        .target(name: "SearchFeature", dependencies: [
            "SearchDomain",
            "SearchData",
            "SearchPresentation"
        ]),
    ],
    swiftLanguageModes: [.v6]
)
