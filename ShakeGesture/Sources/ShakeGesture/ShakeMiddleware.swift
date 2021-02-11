import Combine
import CombineRex
import Foundation
import SwiftRex

public typealias NotificationPublisher = (Notification.Name) -> AnyPublisher<Notification, Never>

extension EffectMiddleware where InputActionType == ShakeAction, OutputActionType == ShakeAction, StateType == Void, Dependencies == NotificationPublisher {
    public static func shakeGesture() -> MiddlewareReader<NotificationPublisher, EffectMiddleware> {
        EffectMiddleware.onAction { action, _, _ in
            let cancellableToken = "shake-gesture-cancellable-token" // In case we want to stop this effect, not observing Notification Center anymore

            switch action {
            case .startMonitoring:
                return Effect(token: cancellableToken) { context in
                    context.dependencies(.shakeGesture)
                        .map { _ in DispatchedAction(.shaken) }
                        .print("Adding this to confirm proper cancellation ;) - ")
                }

            case .stopMonitoring:
                return .toCancel(cancellableToken)

            case .shaken:
                return .doNothing
            }
        }
    }
}
