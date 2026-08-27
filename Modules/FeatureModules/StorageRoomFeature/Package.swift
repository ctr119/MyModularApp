// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "StorageRoomFeature",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "StorageRoomFeature", targets: ["StorageRoomFeature"]),
        /// In order to run Previews/Playgrounds, the target needs to be exposed
        /// and set as dynamic so the data can be injected at runtime
        .library(name: "StorageDomain", type: .dynamic, targets: ["StorageDomain"]),
        .library(name: "StoragePresentation", type: .dynamic, targets: ["StoragePresentation"]),
    ],
    targets: [
        .target(name: "StorageDomain"),
        .target(name: "StorageData", dependencies: [
            "StorageDomain"
        ]),
        .target(name: "StoragePresentation", dependencies: [
            "StorageDomain"
        ]),
        .target(name: "StorageRoomFeature", dependencies: [
            "StorageDomain",
            "StorageData",
            "StoragePresentation"
        ]),
    ],
    swiftLanguageModes: [.v6]
)
