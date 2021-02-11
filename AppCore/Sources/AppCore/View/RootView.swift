import Counter
import CombineRex
import SwiftUI
import SwiftRex

public struct RootView: View {
    @ObservedObject var viewModel: ObservableViewModel<AppAction, AppState>

    public init(viewModel: ObservableViewModel<AppAction, AppState>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        CounterView(
            viewModel: CounterViewModel.viewModel(
                from: viewModel.projection(action: AppAction.count, state: \.count)
            )
        )
    }
}
