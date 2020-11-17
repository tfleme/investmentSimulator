import UIKit

extension NSLayoutAnchor {
    
    @objc
    public func constraint(
        equalTo anchor: NSLayoutAnchor<AnchorType>,
        constant: CGFloat = 0,
        priority: Float = 1000) -> NSLayoutConstraint {
        
        let constraint = self.constraint(equalTo: anchor, constant: constant)
        constraint.priority = UILayoutPriority(rawValue: priority)
        return constraint
    }
}
