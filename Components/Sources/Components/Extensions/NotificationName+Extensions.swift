import UIKit

extension Notification.Name {

    static var keyboardWillHide: Notification.Name {
        return UIResponder.keyboardWillHideNotification
    }

    static var keyboardWillChangeFrame: Notification.Name {
        return UIResponder.keyboardWillChangeFrameNotification
    }
}
