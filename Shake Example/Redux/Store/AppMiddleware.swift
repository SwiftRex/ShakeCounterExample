import CombineRex
import Foundation
import SwiftRex

extension ComposedMiddleware where InputActionType == AppAction, OutputActionType == AppAction, StateType == AppState {
    static func app(dependencies world: World) -> ComposedMiddleware {
        EffectMiddleware.shakeGesture().inject(world.notificationCenter).lift(
            inputAction: \.shake,
            outputAction: AppAction.shake,
            state: ignore
        ) <> EffectMiddleware.appLifecycle().inject(world.notificationCenter).lift(
            inputAction: \.appLifecycle,
            outputAction: AppAction.appLifecycle,
            state: ignore
        ) <> EffectMiddleware.bridge().lift(
            state: ignore
        ) <> LoggerMiddleware().lift(outputAction: absurd)
    }
}
