import AppLifecycle
import Counter
import ShakeGesture

public enum AppAction {
    case count(CountAction)
    case shake(ShakeAction)
    case appLifecycle(AppLifecycleAction)
}

// MARK: Action Enum Properties (use Sourcery for boilerplate code generation)
extension AppAction {
    public var count: CountAction? {
        guard case let .count(value) = self else { return nil }
        return value
    }
    public var shake: ShakeAction? {
        guard case let .shake(value) = self else { return nil }
        return value
    }
    public var appLifecycle: AppLifecycleAction? {
        guard case let .appLifecycle(value) = self else { return nil }
        return value
    }
}
