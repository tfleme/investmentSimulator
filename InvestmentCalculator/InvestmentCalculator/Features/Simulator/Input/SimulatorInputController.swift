import UIKit
import RxSwift

final class SimulatorInputController: BaseViewController {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()
    private let customView = SimulatorInputView()
    private let viewModel: SimulatorInputViewModel

    // MARK: - Initializers

    init(viewModel: SimulatorInputViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View lifecycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupObservables()
    }
}

// MARK: - Private methods - Setup

extension SimulatorInputController {

    private func setupUI() {

        navigationItem.title = "Simulador"

        customView.addStackableView(with: viewModel.amountViewModel)
        customView.addStackableView(with: viewModel.expirationDateViewModel)
        customView.addStackableView(with: viewModel.investmentPerformanceViewModel)
        customView.button.setTitle(viewModel.buttonTitle, for: .normal)
    }

    private func setupObservables() {

        viewModel.isLoading
            .bind(to: customView.button.isLoading)
            .disposed(by: disposeBag)

        viewModel.isButtonEnabled
            .bind(to: customView.button.rx.isEnabled)
            .disposed(by: disposeBag)

        customView.button.rx.tap
            .bind(to: viewModel.buttonTap)
            .disposed(by: disposeBag)
    }
}
