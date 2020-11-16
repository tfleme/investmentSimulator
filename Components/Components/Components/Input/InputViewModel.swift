import UIKit
import RxSwift
import RxRelay

open class InputViewModel {

    // MARK: - Public properties

    public let text = BehaviorRelay<String?>(value: nil)

    // MARK: - Public properties - Output

    public let title: String?
    public let placeholder: String?
    public let errorText: String?
    public let keyboardType: UIKeyboardType
    public let mask: String?

    public let isInputValid = BehaviorRelay<Bool>(value: true)

    // MARK: - Initializers

    public init(title: String? = nil,
                placeholder: String? = nil,
                errorText: String? = nil,
                keyboardType: UIKeyboardType = .default,
                mask: String? = nil) {

        self.title = title
        self.placeholder = placeholder
        self.errorText = errorText
        self.keyboardType = keyboardType
        self.mask = mask
    }
}

// MARK: - Public methods

extension InputViewModel {

    @objc
    func maskedText(
        _ text: String,
        forReplacementString replacementString: String,
        in range: NSRange) -> String {

        guard let mask = mask else { return replacementString }

        let replacementText = (text as NSString).replacingCharacters(in: range, with: replacementString)
        return replacementText.formatted(withMask: mask)
    }
}
