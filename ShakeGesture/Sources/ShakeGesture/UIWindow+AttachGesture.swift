import UIKit

/// SwiftUI limitations workaround, attaches to the motion gesture a custom code that will broadcast a notification on NotificationCenter
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        guard motion == .motionShake else { return }
        NotificationCenter.default.post(name: .shakeGesture, object: event)
    }
}
