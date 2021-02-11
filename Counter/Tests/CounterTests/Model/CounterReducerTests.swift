import Counter
import Foundation
import SwiftRex
import XCTest

class CounterReducerTests: XCTestCase {
    func testIncrement() {
        var state = 42
        Reducer.counter.reduce(.increment, &state)
        XCTAssertEqual(state, 43)
    }

    func testIncrementTwice() {
        var state = 42
        Reducer.counter.reduce(.increment, &state)
        Reducer.counter.reduce(.increment, &state)
        XCTAssertEqual(state, 44)
    }

    func testDecrement() {
        var state = 42
        Reducer.counter.reduce(.decrement, &state)
        XCTAssertEqual(state, 41)
    }

    func testDecrementTwice() {
        var state = 42
        Reducer.counter.reduce(.decrement, &state)
        Reducer.counter.reduce(.decrement, &state)
        XCTAssertEqual(state, 40)
    }

    func testIncrementAndDecrement() {
        var state = 42
        Reducer.counter.reduce(.increment, &state)
        Reducer.counter.reduce(.decrement, &state)
        XCTAssertEqual(state, 42)
    }

    func testDecrementAndIncrement() {
        var state = 42
        Reducer.counter.reduce(.decrement, &state)
        Reducer.counter.reduce(.increment, &state)
        XCTAssertEqual(state, 42)
    }

    func testCompositionWithIncrement() {
        var state = 42
        (Reducer.counter <> Reducer.counter).reduce(.increment, &state)
        XCTAssertEqual(state, 44)
    }

    func testCompositionWithDecrement() {
        var state = 42
        (Reducer.counter <> Reducer.counter).reduce(.decrement, &state)
        XCTAssertEqual(state, 40)
    }
}
