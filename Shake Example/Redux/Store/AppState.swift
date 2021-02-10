struct AppState: Equatable {
    var count: Int

    static var initial: AppState {
        .init(count: 0)
    }
}
