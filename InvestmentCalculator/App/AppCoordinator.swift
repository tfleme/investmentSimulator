import UIKit

final class AppCoordinator {
    
    // MARK: - Private properties
    
    private let navigationController = UINavigationController()
    private let window: UIWindow
    
    private var simulatorCoordinator: SimulatorCoordinator?
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        
        self.window = window
        
        /// instanciate, set and start a coordinator
        
        simulatorCoordinator = SimulatorCoordinator(navigationController: navigationController)
        simulatorCoordinator?.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

