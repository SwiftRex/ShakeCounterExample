import CombineRex
@testable import Counter
import Foundation
import SwiftRex
import XCTest

class CounterViewModelTests: XCTestCase {
    func testLiftingViewStateSide() {
        let store = ObservableViewModel<CountAction, Int>.mock(
            state: 42,
            action: { action, _, state in
                state += 1
            }
        )

        let firstValueExpectation = expectation(description: "first value (initial 42) received")
        let secondValueExpectation = expectation(description: "second value (43) received")
        let thirdValueExpectation = expectation(description: "third value (44) received")
        let fourthValueExpectation = expectation(description: "fourth value (45) received")

        let viewModel = CounterViewModel.viewModel(from: store)

        let cancellable =  viewModel.statePublisher.sink { value in
            switch value {
            case CounterViewModel.ViewState(countLabel: "42"): firstValueExpectation.fulfill()
            case CounterViewModel.ViewState(countLabel: "43"): secondValueExpectation.fulfill()
            case CounterViewModel.ViewState(countLabel: "44"): thirdValueExpectation.fulfill()
            case CounterViewModel.ViewState(countLabel: "45"): fourthValueExpectation.fulfill()
            default: XCTFail("Unexpected value \(value) received")
            }
        }

        store.dispatch(.increment)
        store.dispatch(.increment)
        store.dispatch(.increment)

        wait(for: [firstValueExpectation, secondValueExpectation, thirdValueExpectation, fourthValueExpectation], timeout: 0, enforceOrder: true)
        XCTAssertEqual(store.state, 45)
        _ = cancellable // Please compiler, keep this alive and don't over-optimize memory here, thanks! :-)
    }

    func testLiftingViewActionSide() {
        let firstActionExpectation = expectation(description: "first action (.increment) received")
        let secondActionExpectation = expectation(description: "second action (.decrement) received")
        let thirdActionExpectation = expectation(description: "third action (.decrement) received")
        let fourthActionExpectation = expectation(description: "fourth action (.increment) received")

        var actionsReceived = 0
        let store = ObservableViewModel<CountAction, Int>.mock(
            state: 42,
            action: { action, _, _ in
                actionsReceived += 1
                switch actionsReceived {
                case 1:
                    XCTAssertEqual(action, .increment)
                    firstActionExpectation.fulfill()
                case 2:
                    XCTAssertEqual(action, .decrement)
                    secondActionExpectation.fulfill()
                case 3:
                    XCTAssertEqual(action, .decrement)
                    thirdActionExpectation.fulfill()
                case 4:
                    XCTAssertEqual(action, .increment)
                    fourthActionExpectation.fulfill()
                default: XCTFail("Unexpected action \(action) received")
                }
            }
        )

        let viewModel = CounterViewModel.viewModel(from: store)

        viewModel.dispatch(.plusButtonTap)
        viewModel.dispatch(.minusButtonTap)
        viewModel.dispatch(.minusButtonTap)
        viewModel.dispatch(.plusButtonTap)

        wait(for: [firstActionExpectation, secondActionExpectation, thirdActionExpectation, fourthActionExpectation], timeout: 0, enforceOrder: true)
        XCTAssertEqual(actionsReceived, 4)
    }
}
