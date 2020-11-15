import UIKit

// MARK: - Subviews

extension UIView {
    
    public func addSubviews(_ views: [UIView]) {
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

// MARK: - Insets

extension UIView {
    
    var safeAreaBottomInset: CGFloat {
        guard let safeAreaBottomInset = UIApplication.shared.keyWindow?.safeAreaInsets.bottom else { return 0.0 }
        
        return safeAreaBottomInset
    }
}
