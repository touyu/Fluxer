// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "Fluxer",
  products: [
    .library(name: "Fluxer", targets: ["Fluxer"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "Fluxer", dependencies: [])
  ],
  swiftLanguageVersions: [.v5]
)
