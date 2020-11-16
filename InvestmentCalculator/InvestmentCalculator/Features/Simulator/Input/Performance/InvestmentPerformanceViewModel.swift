import Foundation
import RxSwift
import RxRelay
import Components

final class InvestmentPerformanceViewModel: PercentageInputViewModel {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Public properties - Output

    let performance = BehaviorRelay<Int?>(value: nil)

    // MARK: - Initializers

    init() {

        super.init(title: "Qual o percentual do CDI do investimento? *",
                   placeholder: "100%")

        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentPerformanceViewModel {

    private func setupObservables() {

        text
            .map { $0?.replacingOccurrences(of: "%", with: "") }
            .map(Int.init)
            .bind(to: performance)
            .disposed(by: disposeBag)
    }
}
