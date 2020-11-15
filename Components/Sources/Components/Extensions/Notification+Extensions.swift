import UIKit

extension Notification {
    
    var keyboardAnimationDuration: TimeInterval? {
        (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
    }
    
    var keyboardRect: CGRect? {
        userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
    }
}
