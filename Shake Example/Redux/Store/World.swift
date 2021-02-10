import Combine
import Foundation

// This way we can mock very easily notification center
// It's basically a Publisher that, given certain Notification Name, will give you several Notifications over time, and never fail
typealias NotificationCenterPublisher = (Notification.Name) -> AnyPublisher<Notification, Never>

/// Container for Dependency Injection. This will have all constructors for all mockable services and anything that performs side-effects (Date.init, for example)
/// Most things are expected to be closures, for example:
/// `var date: () -> Date`
/// Which in production will be `{ Date() }` but for tests could be `{ Date(timeIntervalSince1970: 42) }`
struct World {
    let notificationCenter: NotificationCenterPublisher
}
