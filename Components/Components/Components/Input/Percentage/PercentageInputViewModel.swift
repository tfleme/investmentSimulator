import Foundation

open class PercentageInputViewModel: InputViewModel {

    // MARK: - Private properties

    private var input = ""

    // MARK: - Initializers

    public init(title: String? = nil,
                placeholder: String? = nil,
                errorText: String? = nil) {

        super.init(title: title,
                   placeholder: placeholder,
                   errorText: errorText,
                   keyboardType: .numberPad,
                   mask: "%")
    }
}

// MARK: - Public methods

extension PercentageInputViewModel {

    override func maskedText(
        _ text: String,
        forReplacementString replacementString: String,
        in range: NSRange) -> String {

        if range.length == 1 && replacementString.isEmpty && !input.isEmpty {
            input.removeLast()
        } else {
            input.append(replacementString)
        }

        return input.isEmpty ? input : input + "%"
    }
}
