import UIKit

protocol Coordinator {
    func start()
}

protocol BaseCoordinatorParentDelegate: class {
    func didFinish(coordinator: BaseCoordinator)
}

class BaseCoordinator {

    // MARK: - Private properties

    private var identifier: String { return String(describing: self) }
    private var childCoordinators = [String: BaseCoordinator]()

    // MARK: - Public properties

    var rootViewController: BaseViewController? {
        didSet {
            rootViewController?.delegate = self
        }
    }

    weak var parent: BaseCoordinatorParentDelegate?

    // MARK: - Public methods

    func start() {
        fatalError("Start method should be implemented.")
    }

    func coordinate(to coordinator: BaseCoordinator, parent: BaseCoordinator) {

        store(coordinator)
        coordinator.parent = parent
        coordinator.start()
    }
}

// MARK: - Private methods

extension BaseCoordinator {

    private func store(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func free(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = nil
    }
}

// MARK: - BaseCoordinatorParentDelegate

extension BaseCoordinator: BaseCoordinatorParentDelegate {

    func didFinish(coordinator: BaseCoordinator) {
        free(coordinator)
    }
}

// MARK: - BaseViewControllerDelegate

extension BaseCoordinator: BaseViewControllerDelegate {

    func didMoveFromNavigationStack(_ viewController: UIViewController) {
        guard rootViewController === viewController else { return }

        parent?.didFinish(coordinator: self)
    }
}
