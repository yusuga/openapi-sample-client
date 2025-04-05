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
    .package(url: "https://github.com/yusuga/openapi-sample-spec.git", revision: "39134747de92dc33b1293979ecbb4e5cec1963f4"),
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
