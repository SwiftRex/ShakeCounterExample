import Foundation

extension CounterViewModel {
    /// UI events coming from view elements and usually triggered by users, although some could be triggered by SwiftUI (onAppear, for example).
    /// This should be as far as possible from the AppActions, representing not Business Use Cases (Actions), but pure UI terminology (button tap, scroll, drag, toggle)
    /// Any smart logic to transform the ViewAction into an AppAction should be done in the `from(viewAction: ViewAction)` initialiser, which returns
    /// an Optional AppAction, in case you want to simply ignore something coming from the view elements.
    public enum ViewAction {
        case plusButtonTap
        case minusButtonTap
    }

    public static func from(viewAction: ViewAction) -> CountAction? {
        switch viewAction {
        case .plusButtonTap: return .increment
        case .minusButtonTap: return .decrement
        }
    }
}
