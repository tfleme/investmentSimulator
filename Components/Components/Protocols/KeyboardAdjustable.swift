import UIKit

public protocol KeyboardAdjustable {
    var keyboardLayoutGuideBottomConstraint: NSLayoutConstraint { get }
    func setupKeyboardNotifications()
    func adjustForKeyboard(notification: Notification)
}

// MARK: - KeyboardAdjustable default implementations

extension KeyboardAdjustable where Self: UIView {

    public func setupKeyboardNotifications() {

        _ = NotificationCenter.default.addObserver(
            forName: .keyboardWillHide,
            object: nil,
            queue: .main,
            using: { [weak self] in self?.adjustForKeyboard(notification: $0) })

        _ = NotificationCenter.default.addObserver(
            forName: .keyboardWillChangeFrame,
            object: nil,
            queue: .main,
            using: { [weak self] in self?.adjustForKeyboard(notification: $0) })
    }

    public func adjustForKeyboard(notification: Notification) {
        guard
            let keyboardRect = notification.keyboardRect,
            let animationDuration = notification.keyboardAnimationDuration
        else { return }

        if notification.name == UIResponder.keyboardWillHideNotification {
            keyboardLayoutGuideBottomConstraint.constant = 0.0
        } else {
            keyboardLayoutGuideBottomConstraint.constant = safeAreaBottomInset - keyboardRect.height
        }

        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
}
