// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "NetworkKit", targets: ["NetworkKit"]),
    ],
    targets: [
        .target(name: "NetworkKit"),
    ],
    swiftLanguageModes: [.v6]
)
