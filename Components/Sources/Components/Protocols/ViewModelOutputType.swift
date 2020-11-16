import Foundation
import RxSwift
import RxRelay

public protocol ViewModelOutputType {
    var isLoading: BehaviorRelay<Bool> { get }
    func showLoading()
    func hideLoading()
    func handleError<T>(_ error: Error) -> Observable<T>
}

// MARK: - Default implementations

extension ViewModelOutputType {

    public func showLoading() {
        isLoading.accept(true)
    }

    public func hideLoading() {
        isLoading.accept(false)
    }

    public func handleError<T>(_ error: Error) -> Observable<T> {

        hideLoading()
        return .never()
    }
}
