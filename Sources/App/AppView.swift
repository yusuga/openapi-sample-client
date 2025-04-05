import SwiftUI
import MyServiceAPIClient
import OpenAPIURLSession

struct AppView: View {

  @State private var userName = "None"
  @State private var storeName = "None"

  private let apiClient = Client(
    serverURL: try! Servers.Server1.url(),
    transport: URLSessionTransport()
  )

  init() {}

  var body: some View {
    List {
      Section {
        Button("Request User", action: requestUser)
        Text("Name: \(userName)")
      }
      Section {
        Button("Request Store", action: requestStore)
        Text("Name: \(storeName)")
      }
    }
  }
}

extension AppView {
  func requestUser() {
    Task {
      do {
        userName = try await apiClient.getUser().ok.body.json.name
      } catch {
        userName = "Error"
        print("\(#function) error: \(error)")
      }
    }
  }

  func requestStore() {
    Task {
      do {
        storeName = try await apiClient.getStore().ok.body.json.name
      } catch {
        storeName = "Error"
        print("\(#function) error: \(error)")
      }
    }
  }
}

#Preview {
  AppView()
}
