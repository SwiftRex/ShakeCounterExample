import Counter
import Foundation
import SwiftRex
import XCTest

class CounterViewActionTests: XCTestCase {
    func testPlusButtonToCountAction() {
        let countAction = CounterViewModel.from(viewAction: .plusButtonTap)
        XCTAssertEqual(countAction, .increment)
    }

    func testMinusButtonToCountAction() {
        let countAction = CounterViewModel.from(viewAction: .minusButtonTap)
        XCTAssertEqual(countAction, .decrement)
    }
}
