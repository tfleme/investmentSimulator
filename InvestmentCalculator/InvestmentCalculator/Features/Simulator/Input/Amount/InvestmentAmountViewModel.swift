import Foundation
import RxSwift
import RxRelay
import Components

final class InvestmentAmountViewModel: CurrencyInputViewModel {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Public properties - Output

    let amount = BehaviorRelay<Decimal?>(value: nil)

    // MARK: - Initializers

    init() {

        super.init(title: L10n.SimulatorInput.Amount.title,
                   placeholder: L10n.SimulatorInput.Amount.placeholder,
                   accessibilityLabel: "InvestmentAmountView")

        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentAmountViewModel {

    private func setupObservables() {

        text
            .map { Decimal(fromCurrencyString: $0) }
            .bind(to: amount)
            .disposed(by: disposeBag)
    }
}
