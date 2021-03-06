import Foundation
import RxSwift
import RxCocoa
import Components

protocol SimulatorInputViewModelDelegate: class {
    func didSimulate(with detail: InvestmentDetail)
}

final class SimulatorInputViewModel: ViewModelOutputType {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    private weak var delegate: SimulatorInputViewModelDelegate?
    private let useCases: InvesmentSimulationUseCasesType

    private let simulationParameters = BehaviorRelay<InvestmentSimulationParameters?>(value: nil)

    // MARK: - Public properties - Input

    let buttonTap = PublishRelay<Void>()

    // MARK: - Public properties - Output

    let isLoading = BehaviorRelay<Bool>(value: false)

    let amountViewModel = InvestmentAmountViewModel()
    lazy var expirationDateViewModel = InvestmentExpirationDateViewModel(useCases: useCases)
    let investmentPerformanceViewModel = InvestmentPerformanceViewModel()
    let buttonTitle = L10n.SimulatorInput.buttonTitle

    let isButtonEnabled = BehaviorRelay<Bool>(value: false)

    // MARK: - Initializers

    init(delegate: SimulatorInputViewModelDelegate, useCases: InvesmentSimulationUseCasesType) {

        self.delegate = delegate
        self.useCases = useCases

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
            .map(InvestmentSimulationParameters.init)
            .bind(to: simulationParameters)
            .disposed(by: disposeBag)

        simulationParameters
            .map { $0 != nil }
            .bind(to: isButtonEnabled)
            .disposed(by: disposeBag)

        buttonTap
            .subscribe(onNext: { [weak self] in self?.simulate() })
            .disposed(by: disposeBag)
    }

    private func simulate() {
        guard let simulationParameters = simulationParameters.value else { return }

        useCases.simulate(with: simulationParameters)
            .observeOn(MainScheduler.instance)
            .catchError(handleError)
            .do(onCompleted: hideLoading, onSubscribe: showLoading)
            .subscribe(onNext: { [weak self] in self?.delegate?.didSimulate(with: $0) })
            .disposed(by: disposeBag)
    }
}
