// swift-tools-version:6.0
import PackageDescription

let package = Package(
  name: "AppFeature",
  platforms: [
    .iOS(.v17)
  ],
  dependencies: [
    // OpenAPI
    .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
    // MyService
    .package(url: "https://github.com/yusuga/openapi-sample-spec.git", revision: "f83d735a87233095e8b2b625da53651c44a213cc"),
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
        .product(name: "MyServiceAPIClient", package: "openapi-sample-spec"),
      ]
    ),
  ]
)
