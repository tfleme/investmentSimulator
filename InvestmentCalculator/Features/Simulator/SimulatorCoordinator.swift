import UIKit

final class SimulatorCoordinator: BaseCoordinator {
    
    // MARK: - Private properties
    
    private let navigationController: UINavigationController
    
    // MARK: - Public properties
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    override func start() {
        
        let viewModel = SimulatorInputViewModel(delegate: self)
        let viewController = SimulatorInputController(viewModel: viewModel)
        
        rootViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - SimulatorInputViewModelDelegate

extension SimulatorCoordinator: SimulatorInputViewModelDelegate {
    
}
