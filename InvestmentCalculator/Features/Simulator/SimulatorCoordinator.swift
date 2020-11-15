import UIKit

final class SimulatorCoordinator: BaseCoordinator {
    
    typealias Factory = InvesmentSimulationUseCasesFactory
    
    // MARK: - Private properties
    
    private let navigationController: UINavigationController
    private let factory: Factory
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController, factory: Factory) {
        
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - Public methods
    
    override func start() {
        
        let viewModel = SimulatorInputViewModel(delegate: self, useCases: factory.makeInvesmentSimulationUseCases())
        let viewController = SimulatorInputController(viewModel: viewModel)
        
        rootViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - SimulatorInputViewModelDelegate

extension SimulatorCoordinator: SimulatorInputViewModelDelegate {
    
    func didSimulate(with detail: InvestmentDetail) {
        
    }
}
