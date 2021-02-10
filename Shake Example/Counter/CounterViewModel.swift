import CombineRex
import SwiftRex
import SwiftUI

/// It's the logic for certain view, responsible for the information flow in 2 directions:
/// - those actions coming from the view (ViewAction) being transformed into AppActions
/// - the state publisher values being transformed into view state (flat primitive values easy to bind into view elements)
/// It only glues everything, the transformations themselves are done by ViewState and ViewAction initialisers.
enum CounterViewModel {
    static func viewModel<S: StoreType>(from store: S) -> ObservableViewModel<ViewAction, ViewState> where S.ActionType == CountAction, S.StateType == Int {
        store.projection(
            action: from(viewAction:),
            state: from(modelState:)
        ).asObservableViewModel(initialState: .empty)
    }
}
