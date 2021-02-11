@testable import Counter
import SnapshotTesting

class CounterViewTests: SnapshotTestBase {
    // *****************************************************
    // IMPORTANT: Run using `iPad Pro (12.9-inch) (4th generation)` on Xcode 12.4 so the Reference Images will match.
    // *****************************************************

    func testViewShowing42() {
        let view = CounterView(viewModel: .mock(state: .init(countLabel: "42")))

        assertSnapshotDevices(view)
    }

    func testViewShowingMinus42() {
        let view = CounterView(viewModel: .mock(state: .init(countLabel: "-42")))

        assertSnapshotDevices(view)
    }
}

