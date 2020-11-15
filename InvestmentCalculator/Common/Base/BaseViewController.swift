import UIKit
import RxRelay

protocol BaseViewControllerDelegate: class {
    func didMoveFromNavigationStack(_ viewController: UIViewController)
}

class BaseViewController: UIViewController {

    // MARK: - Public properties
    
    weak var delegate: BaseViewControllerDelegate?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
        setupLeftBarButton()
    }
}

// MARK: - Private methods

extension BaseViewController {
    
    private func setupLeftBarButton() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
