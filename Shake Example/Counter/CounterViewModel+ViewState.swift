import Foundation

extension CounterViewModel {
    /// Flat primitive values easy to bind into view elements
    /// This should be as far as possible from Business Model terminology, and close to Label, Text, Toggle names.
    /// Any smart logic to transform the AppState into a ViewState (NumberFormatter, etc) should be done in the `from(appState: AppState)` initialiser.
    struct ViewState: Equatable {
        let title: String = "Welcome to the Redux counter"
        let countLabel: String
        static var empty: ViewState {
            .init(countLabel: "")
        }
    }

    static func from(modelState: Int) -> ViewState {
        ViewState(countLabel: "\(modelState)")
    }
}
