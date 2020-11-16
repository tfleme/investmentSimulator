import Foundation
import RxSwift
import RxCocoa
import Components

protocol InvestmentSimulationDetailViewModelDelegate: class {
    func didSelectSimulate()
}

final class InvestmentSimulationDetailViewModel {

    typealias Localizabe = L10n.SimulatorDetail

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    private weak var delegate: InvestmentSimulationDetailViewModelDelegate?

    // MARK: - Public properties - Input

    let buttonTap = PublishRelay<Void>()

    // MARK: - Public properties - Output

    let summaryViewModel: CurrencyContentViewModel
    let parametersViewModel: DetailListViewModel
    let detailsViewModel: DetailListViewModel

    let buttonTitle = Localizabe.buttonTitle

    // MARK: - Initializers

    init(delegate: InvestmentSimulationDetailViewModelDelegate, detail: InvestmentDetail) {

        self.delegate = delegate
        self.summaryViewModel = CurrencyContentViewModel(
            title: Localizabe.title,
            currency: detail.grossAmount.currencyString,
            description: Localizabe.currency(detail.grossAmountProfit.currencyString))
        self.parametersViewModel = DetailListViewModel(detailViewModels: [
            DetailViewModel(
                title: Localizabe.investedAmount,
                value: detail.investmentParameter.investedAmount.currencyString),
            DetailViewModel(title: Localizabe.grossAmount, value: detail.grossAmount.currencyString),
            DetailViewModel(title: Localizabe.grossProfit, value: detail.grossAmountProfit.currencyString),
            DetailViewModel(
                title: Localizabe.taxesRate,
                value: "\(detail.taxesAmount.currencyString) (\(detail.taxesRate.percentString))"),
            DetailViewModel(title: Localizabe.netAmount, value: detail.netAmount.currencyString)
        ])
        self.detailsViewModel = DetailListViewModel(detailViewModels: [
            DetailViewModel(title: Localizabe.maturityDate, value: detail.investmentParameter.maturityDate.appString),
            DetailViewModel(
                title: Localizabe.maturityTotalDays,
                value: "\(detail.investmentParameter.maturityTotalDays)"),
            DetailViewModel(title: Localizabe.monthlyGrossProfit, value: detail.monthlyGrossRateProfit.percentString),
            DetailViewModel(title: Localizabe.rate, value: detail.investmentParameter.rate.percentString),
            DetailViewModel(title: Localizabe.annualGrossProfit, value: detail.annualGrossRateProfit.percentString),
            DetailViewModel(title: Localizabe.rateProfit, value: detail.rateProfit.percentString)
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
