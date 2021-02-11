import Foundation
import SwiftRex

class LoggerMiddleware: Middleware {
    private var getState: GetState<AppState>?
    func receiveContext(getState: @escaping GetState<AppState>, output: AnyActionHandler<Never>) {
        self.getState = getState
    }
    // TODO: Not production ready, don't use this in release builds
    func handle(action: AppAction, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
        guard let getState = self.getState else { return }

        let stateBefore = getState()
        afterReducer = .do {
            let stateAfter = getState()
            print("***")
            defer { print("***\n") }

            print("Action: \(action) from \(dispatcher)")
            guard stateBefore != stateAfter else { return }
            print("Old State: \(stateBefore)")
            print("New State: \(stateAfter)")
        }
    }
}

