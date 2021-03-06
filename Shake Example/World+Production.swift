import AppCore
import Foundation

extension World {
    static var production: World {
        World(
            // A real notification center in a production app is the publisher created from NotificationCenter.default for a given notification name
            // Erase to any publisher just to avoid using the hardcoded specialized NotificationCenter.Publisher that is harder to be mocked
            notificationCenter: { notificationName in NotificationCenter.default.publisher(for: notificationName).eraseToAnyPublisher() }
        )
    }
}
