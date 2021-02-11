import CombineRex
import SwiftUI

/// SwiftUI View that allows user to increment or decrement the counter by tapping the buttons
/// It's also possible to see current counter. From any screen it's also possible to increment the counter by shaking the device.
public struct CounterView: View {
    @ObservedObject var viewModel: ObservableViewModel<CounterViewModel.ViewAction, CounterViewModel.ViewState>

    public init(viewModel: ObservableViewModel<CounterViewModel.ViewAction, CounterViewModel.ViewState>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            Text(viewModel.state.title).font(.largeTitle).padding()

            HStack {
                Button("-") { viewModel.dispatch(.minusButtonTap) }.font(.body).padding()
                Text(viewModel.state.countLabel).font(.title).padding()
                Button("+") { viewModel.dispatch(.plusButtonTap) }.font(.body).padding()
            }.padding()
        }
        .padding()
    }
}

#if DEBUG
// IMPORTANT:
// For this to work, please select target Counter at the top
// This seems to be a Xcode bug
struct CounterViewPreview: PreviewProvider {
    static var previews: some View {
        CounterView(
            viewModel: .mock(
                state: CounterViewModel.from(modelState: -42)
            ))
            .previewDevice("iPhone SE")
    }
}
#endif
