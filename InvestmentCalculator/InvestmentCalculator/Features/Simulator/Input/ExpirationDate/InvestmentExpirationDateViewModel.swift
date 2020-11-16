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

        super.init(title: "Qual a data de vencimento do investimento? *",
                   placeholder: "dia/mês/ano",
                   errorText: "Data inválida.",
                   keyboardType: .numberPad,
                   mask: "##/##/####")

        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentExpirationDateViewModel {

    private func setupObservables() {

        text
            .map { Date(withString: $0) }
            .bind(to: expirationDate)
            .disposed(by: disposeBag)
    }
}
