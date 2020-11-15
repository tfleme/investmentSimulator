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
        
        super.init(title: "Quanto você gostaria de aplicar? *",
                   placeholder: "R$")
        
        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentAmountViewModel {
    
    private func setupObservables() {
        
        text
            .compactMap { Decimal(fromCurrencyString: $0) }
            .bind(to: amount)
            .disposed(by: disposeBag)
    }
}
