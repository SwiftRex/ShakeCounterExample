import Counter
import SwiftUI
import SwiftRex

func rootView<S: StoreType>(store: S) -> some View where S.ActionType == AppAction, S.StateType == AppState {
    CounterView(
        viewModel: CounterViewModel.viewModel(
            from: store.projection(action: AppAction.count, state: \.count)
        )
    )
}
