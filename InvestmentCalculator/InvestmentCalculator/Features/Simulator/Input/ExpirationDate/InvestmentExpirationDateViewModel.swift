import Foundation
import RxSwift
import RxRelay
import Components

final class InvestmentExpirationDateViewModel: InputViewModel {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()
    private let useCases: InvestmentExpirationDateUseCasesType

    // MARK: - Public properties - Output

    let expirationDate = BehaviorRelay<Date?>(value: nil)

    // MARK: - Initializers

    init(useCases: InvestmentExpirationDateUseCasesType) {

        self.useCases = useCases

        super.init(title: L10n.SimulatorInput.ExpirationDate.title,
                   placeholder: L10n.SimulatorInput.ExpirationDate.placeholder,
                   errorText: L10n.SimulatorInput.ExpirationDate.error,
                   keyboardType: .numberPad,
                   mask: L10n.Default.dayMonthYearMask,
                   accessibilityLabel: "InvestmentExpirationDateView")

        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentExpirationDateViewModel {

    private func setupObservables() {

        text
            .map(useCases.validDate)
            .bind(to: expirationDate)
            .disposed(by: disposeBag)

        expirationDate
            .skip(1)
            .map { $0 != nil }
            .bind(to: isInputValid)
            .disposed(by: disposeBag)
    }
}
