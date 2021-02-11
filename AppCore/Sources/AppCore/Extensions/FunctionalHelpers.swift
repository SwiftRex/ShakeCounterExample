import Foundation

func ignore<T>(_ t: T) -> Void { }
func identity<T>(_ t: T) -> T { t }
func absurd<T>(_ never: Never) -> T { }
