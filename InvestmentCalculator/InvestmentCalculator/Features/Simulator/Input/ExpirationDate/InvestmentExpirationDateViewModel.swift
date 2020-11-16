import Foundation
import RxSwift
import RxRelay
import Components

final class InvestmentExpirationDateViewModel: InputViewModel {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    // MARK: - Public properties - Output

    let expirationDate = BehaviorRelay<Date?>(value: nil)

    // MARK: - Initializers

    init() {

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

        #warning("Tiago Leme: Add validation logic")

        text
            .map { Date(withAppString: $0) }
            .bind(to: expirationDate)
            .disposed(by: disposeBag)
    }
}
