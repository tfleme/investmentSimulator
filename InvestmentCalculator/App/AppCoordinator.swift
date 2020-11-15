import UIKit

final class AppCoordinator {
    
    typealias Factory = SimulatorCoordinator.Factory
    
    // MARK: - Private properties
    
    private let navigationController = UINavigationController()
    private let window: UIWindow
    private let factory: Factory
    
    private var simulatorCoordinator: SimulatorCoordinator?
    
    // MARK: - Initialization
    
    init(window: UIWindow, factory: Factory) {
        
        self.window = window
        self.factory = factory
        
        setupNavigationBar()
        
        /// instanciate, set and start a coordinator
        simulatorCoordinator = SimulatorCoordinator(navigationController: navigationController, factory: factory)
        simulatorCoordinator?.start()
        
        /// Update window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - Private methods

extension AppCoordinator {
    
    private func setupNavigationBar() {
        
        navigationController.navigationBar.tintColor = .primaryGreen
        navigationController.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.mediumGray
        ]
    }
}

