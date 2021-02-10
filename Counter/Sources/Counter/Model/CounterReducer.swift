import SwiftRex

extension Reducer where ActionType == CountAction, StateType == Int {
    public static var counter: Reducer {
        Reducer.reduce { action, state in
            switch action {
            case .decrement:
                state -= 1
            case .increment:
                state += 1
            }
        }
    }
}
