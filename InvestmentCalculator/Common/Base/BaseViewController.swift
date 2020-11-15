import UIKit
import RxRelay

protocol BaseViewControllerDelegate: class {
    func didMoveFromNavigationStack(_ viewController: UIViewController)
}

class BaseViewController: UIViewController {

    // MARK: - Public properties
    
    let rightBarButtonTap = PublishRelay<Void>()
    weak var delegate: BaseViewControllerDelegate?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension BaseViewController: UINavigationControllerDelegate {
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent == nil {
            delegate?.didMoveFromNavigationStack(self)
        }
    }
}

// MARK: - Public methods - Navigation item

extension BaseViewController {
    
    @objc func handleRightBarButtonTap() {
        rightBarButtonTap.accept(())
    }
}

// MARK: - Public methods - Navigation

extension BaseViewController {
    
    func popViewControllerStack(animated: Bool) {
        
        if navigationController?.viewControllers.first === self {
            navigationController?.setViewControllers([], animated: animated)
        } else {
            navigationController?.popToViewController(self, animated: false)
            navigationController?.popViewController(animated: animated)
        }
    }
}
