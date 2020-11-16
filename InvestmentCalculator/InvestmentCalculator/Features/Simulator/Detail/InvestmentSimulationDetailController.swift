import UIKit
import RxSwift

final class InvestmentSimulationDetailController: BaseViewController {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()
    private let customView = InvestmentSimulationDetailView()
    private let viewModel: InvestmentSimulationDetailViewModel

    // MARK: - Initializers

    init(viewModel: InvestmentSimulationDetailViewModel) {
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

extension InvestmentSimulationDetailController {

    private func setupUI() {

        navigationItem.title = L10n.SimulatorDetail.NavigationItem.title

        customView.addStackableView(with: viewModel.summaryViewModel)
        customView.addStackableView(with: viewModel.parametersViewModel)
        customView.addStackableView(with: viewModel.detailsViewModel)
        customView.button.setTitle(viewModel.buttonTitle, for: .normal)
    }

    private func setupObservables() {

        customView.button.rx.tap
            .bind(to: viewModel.buttonTap)
            .disposed(by: disposeBag)
    }
}
