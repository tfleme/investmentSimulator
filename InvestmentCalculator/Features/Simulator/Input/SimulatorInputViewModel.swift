import Foundation
import RxSwift
import RxCocoa
import Components

protocol SimulatorInputViewModelDelegate: class {
    
}

final class SimulatorInputViewModel: ViewModelOutputType {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    private weak var delegate: SimulatorInputViewModelDelegate?
    
    // MARK: - Public properties - Input
    
    let buttonTap = PublishRelay<Void>()
    
    // MARK: - Public properties - Output
    
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    let amountViewModel = InvestmentAmountViewModel()
    let expirationDateViewModel = InvestmentExpirationDateViewModel()
    let investmentPerformanceViewModel = InvestmentPerformanceViewModel()
    let buttonTitle: String = "Simular"
    
    // MARK: - Initializers

    init(delegate: SimulatorInputViewModelDelegate) {
        
        self.delegate = delegate
        
        setupObservables()
    }
}

// MARK: - Private methods

extension SimulatorInputViewModel {
    
    private func setupObservables() {
        
        Observable.combineLatest(
                amountViewModel.amount,
                expirationDateViewModel.expirationDate,
                investmentPerformanceViewModel.performance)
            .subscribe(onNext: { [weak self] amount, expirationDate, performance in

                print("\(amount) : \(expirationDate) : \(performance)")
            })
            .disposed(by: disposeBag)
        
        buttonTap
            .do(onNext: { [weak self] in
                
                self?.showLoading()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    self?.hideLoading()
                }
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
}

