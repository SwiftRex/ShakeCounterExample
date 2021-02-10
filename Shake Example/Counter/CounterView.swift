import CombineRex
import SwiftUI

/// SwiftUI View that allows user to increment or decrement the counter by tapping the buttons
/// It's also possible to see current counter. From any screen it's also possible to increment the counter by shaking the device.
struct CounterView: View {
    @ObservedObject var viewModel: ObservableViewModel<CounterViewModel.ViewAction, CounterViewModel.ViewState>

    var body: some View {
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
