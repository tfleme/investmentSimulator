import UIKit

extension Collection where Self.Element == NSLayoutConstraint {
    
    public func activate() {
        
        forEach { $0.isActive = true }
    }
}
