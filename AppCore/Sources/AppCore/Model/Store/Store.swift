import Combine
import CombineRex
import Foundation
import SwiftRex

public class Store: ReduxStoreBase<AppAction, AppState> {
    public static func create(dependencies world: World) -> Store {
        let store = Store(
            subject: .combine(initialValue: AppState(count: 0)),
            reducer: Reducer.app(),
            middleware: ComposedMiddleware.app(dependencies: world)
        )
        store.dispatch(.appLifecycle(.start))
        return store
    }
}
