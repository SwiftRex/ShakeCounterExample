import Combine
import CombineRex
import Foundation
import SwiftRex
import UIKit

extension EffectMiddleware where InputActionType == AppLifecycleAction, OutputActionType == AppLifecycleAction, StateType == Void, Dependencies == NotificationCenterPublisher {
    static func appLifecycle() -> MiddlewareReader<NotificationCenterPublisher, EffectMiddleware> {
        EffectMiddleware.onAction { action, _, _ in
            let cancellableToken = "app-lifecycle-cancellable-token" // In case we want to stop this effect, not observing Notification Center anymore

            switch action {
            case .start:
                return Effect(token: cancellableToken) { context -> AnyPublisher<DispatchedAction<AppLifecycleAction>, Never> in
                    let notificationCenter = context.dependencies

                    let foregroundPublisher = notificationCenter(UIApplication.willEnterForegroundNotification)
                        .map { _ in DispatchedAction(AppLifecycleAction.willEnterForeground) }

                    let backgroundPublisher = notificationCenter(UIApplication.didEnterBackgroundNotification)
                        .map { _ in DispatchedAction(AppLifecycleAction.didEnterBackground) }

                    return Publishers.Merge(foregroundPublisher, backgroundPublisher)
                        .eraseToAnyPublisher()
                }
            case .didEnterBackground, .willEnterForeground:
                return .doNothing
            }
        }
    }
}
