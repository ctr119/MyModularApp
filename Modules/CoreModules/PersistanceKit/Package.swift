// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "PersistanceKit",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "PersistanceKit", targets: ["PersistanceKit"]),
    ],
    targets: [
        .target(name: "PersistanceKit"),
    ],
    swiftLanguageModes: [.v6]
)
