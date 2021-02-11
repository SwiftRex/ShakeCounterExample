import Foundation
import SnapshotTesting
import SwiftUI
import XCTest

open class SnapshotTestBase: XCTestCase {
    public var allowAnimations: Bool = false

    override open func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(allowAnimations)
    }

    open var defaultDevices: [(name: String, device: ViewImageConfig)] {
        [
            ("SE", .iPhoneSe),
            ("X", .iPhoneX),
            ("iPadMini", .iPadMini(.portrait) ),
            ("iPadPro", .iPadPro12_9(.portrait))
        ]
    }

    open func assertSnapshotDevices<V: View>(
        _ view: V,
        devices: [(name: String, device: ViewImageConfig)]? = nil,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        (devices ?? defaultDevices).forEach {
            let vc = UIHostingController(rootView: view)

            assertSnapshot(
                matching: vc,
                as: .image(on: $0.device),
                file: file,
                testName: "\(testName)-\($0.name)",
                line: line
            )
        }
    }
}
