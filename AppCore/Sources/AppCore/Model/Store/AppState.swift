public struct AppState: Equatable {
    public var count: Int

    public static var initial: AppState {
        .init(count: 0)
    }
}
