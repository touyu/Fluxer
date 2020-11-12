// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "Fluxer",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "Fluxer", targets: ["Fluxer"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "Fluxer", path: "Sources")
  ],
  swiftLanguageVersions: [.v5]
)
