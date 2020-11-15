import UIKit

extension UIStackView {
    
    public func addArrangedSubviews(_ views: [UIView]) {
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview($0)
        }
    }
}
