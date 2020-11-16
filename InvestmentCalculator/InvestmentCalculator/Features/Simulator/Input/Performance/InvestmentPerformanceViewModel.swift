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

        super.init(title: L10n.SimulatorInput.Performance.title,
                   placeholder: L10n.SimulatorInput.Performance.placeholder,
                   accessibilityLabel: "InvestmentPerformanceView")

        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentPerformanceViewModel {

    private func setupObservables() {

        text
            .compactMap { $0?.replacingOccurrences(of: "%", with: "") }
            .map(Int.init)
            .bind(to: performance)
            .disposed(by: disposeBag)
    }
}
