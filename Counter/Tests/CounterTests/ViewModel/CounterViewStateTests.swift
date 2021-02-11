@testable import Counter
import Foundation
import SwiftRex
import XCTest

class CounterViewStateTests: XCTestCase {
    func testEmptyViewState() {
        let emptyViewState = CounterViewModel.ViewState.empty
        XCTAssertEqual(emptyViewState.title, "Welcome to the Redux counter")
        XCTAssertEqual(emptyViewState.countLabel, "")
    }

    func testViewStateFrom42() {
        let viewState = CounterViewModel.from(modelState: 42)
        XCTAssertEqual(viewState.title, "Welcome to the Redux counter")
        XCTAssertEqual(viewState.countLabel, "42")
    }

    func testViewStateFromMinus42() {
        let viewState = CounterViewModel.from(modelState: -42)
        XCTAssertEqual(viewState.title, "Welcome to the Redux counter")
        XCTAssertEqual(viewState.countLabel, "-42")
    }
}
