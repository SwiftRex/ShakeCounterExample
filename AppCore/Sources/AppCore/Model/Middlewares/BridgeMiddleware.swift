import AppLifecycle
import CombineRex
import Foundation
import ShakeGesture
import SwiftRex

extension ActionSource {
    func bridged<A>(from action: A, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) -> ActionSource {
        ActionSource(
            file: self.file,
            function: self.function,
            line: self.line,
            info: [self.info, "Bridged from action \(action) on file \(file), function: \(function), line: \(line)"].compactMap { $0}.joined(separator: "\n")
        )
    }
}

extension EffectMiddleware where InputActionType == AppAction, OutputActionType == AppAction, StateType == Void, Dependencies == Void {
    /// The purpose of this middleware is to coordinate different actions from different modules, so they can talk to each other indirectly
    /// For that to be possible, this must be a very wide AppAction on Input and Output, which is usually not good for the sake of switch/case and
    /// also because EVERY action in the app will be router here. Still, a single bridge middleware should be harmless
    static func bridge() -> EffectMiddleware {
        EffectMiddleware.onAction { originalAction, dispatcher, _ in
            switch originalAction {
            case .appLifecycle(.willEnterForeground): return .just(.shake(.startMonitoring), from: dispatcher.bridged(from: originalAction))
            case .appLifecycle(.didEnterBackground): return .just(.shake(.stopMonitoring), from: dispatcher.bridged(from: originalAction))
            case .shake(.shaken): return .just(.count(.increment), from: dispatcher.bridged(from: originalAction))
            default: return .doNothing
            }
        }
    }
}
