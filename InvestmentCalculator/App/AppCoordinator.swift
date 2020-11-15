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
        
        /// instanciate, set and start a coordinator
        
        simulatorCoordinator = SimulatorCoordinator(navigationController: navigationController, factory: factory)
        simulatorCoordinator?.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

