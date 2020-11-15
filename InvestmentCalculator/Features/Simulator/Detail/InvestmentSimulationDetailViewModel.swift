import Foundation
import RxSwift
import RxCocoa
import Components

protocol InvestmentSimulationDetailViewModelDelegate: class {
    func didSelectSimulate()
}

final class InvestmentSimulationDetailViewModel {
    
    // MARK: - Private properties
    
    private let disposeBag = DisposeBag()
    
    private weak var delegate: InvestmentSimulationDetailViewModelDelegate?
    
    // MARK: - Public properties - Input
    
    let buttonTap = PublishRelay<Void>()
    
    // MARK: - Public properties - Output
    
    let summaryViewModel: CurrencyContentViewModel
    let parametersViewModel: DetailListViewModel
    let detailsViewModel: DetailListViewModel
    
    let buttonTitle = "Simular novamente"
    
    // MARK: - Initializers

    init(delegate: InvestmentSimulationDetailViewModelDelegate, detail: InvestmentDetail) {
        
        self.delegate = delegate
        self.summaryViewModel = CurrencyContentViewModel(
            title: "Resultado da simulação",
            currency: detail.grossAmount.currencyString,
            description: "Rendimento total de \(detail.grossAmountProfit.currencyString)")
        #warning("Tiago Leme: needs to do tax calculation")
        self.parametersViewModel = DetailListViewModel(detailViewModels: [
            DetailViewModel(title: "Valor aplicado inicialmente", value: detail.investmentParameter.investedAmount.currencyString),
            DetailViewModel(title: "Valor bruto do investimento", value: detail.grossAmount.currencyString),
            DetailViewModel(title: "Valor do rendimento", value: detail.grossAmountProfit.currencyString),
            DetailViewModel(title: "IR sobre o investimento", value: detail.taxesRate.currencyString),
            DetailViewModel(title: "Valor líquido do investimento", value: detail.netAmount.currencyString)
        ])
        self.detailsViewModel = DetailListViewModel(detailViewModels: [
            DetailViewModel(title: "Data de resgate", value: detail.investmentParameter.maturityDate.appString),
            DetailViewModel(title: "Dias corridos", value: "\(detail.investmentParameter.maturityTotalDays)"),
            DetailViewModel(title: "Rendimento mensal", value: detail.monthlyGrossRateProfit.percentString),
            DetailViewModel(title: "Percentual do CDI do investimento", value: detail.investmentParameter.rate.percentString),
            DetailViewModel(title: "Rentabilidade anual", value: detail.annualGrossRateProfit.percentString),
            DetailViewModel(title: "Rentabilidade no período", value: detail.rateProfit.percentString),
        ])
        
        setupObservables()
    }
}

// MARK: - Private methods

extension InvestmentSimulationDetailViewModel {
    
    private func setupObservables() {
        
        buttonTap
            .subscribe(onNext: { [weak self] in self?.delegate?.didSelectSimulate() })
            .disposed(by: disposeBag)
    }
}
