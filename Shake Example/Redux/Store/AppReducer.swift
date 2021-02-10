import Counter
import Foundation
import SwiftRex

extension Reducer where ActionType == AppAction, StateType == AppState {
    static func app() -> Reducer {
        Reducer<CountAction, Int>.counter.lift(
            action: \.count,
            state: \.count
        )
    }
}
