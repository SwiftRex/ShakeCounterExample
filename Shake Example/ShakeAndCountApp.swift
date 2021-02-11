import AppCore
import SwiftUI

@main
struct ShakeAndCountApp: App {
    @StateObject var store = Store.create(dependencies: .production).asObservableViewModel(initialState: .initial)

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: store)
        }
    }
}
