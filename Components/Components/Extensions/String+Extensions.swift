import Foundation

extension String {

    func formatted(withMask mask: String?) -> String {
        guard let mask = mask else { return self }

        let text = replacingOccurrences(of: "/", with: "")

        var formattedText = ""
        var index = text.startIndex

        for character in mask where index < text.endIndex {
            guard character == "#" else {
                formattedText.append(character)
                continue
            }

            formattedText.append(text[index])
            index = text.index(after: index)
        }

        return formattedText
    }

    var number: NSNumber {
        guard !isEmpty, let doubleValue = Double(self) else { return .init(value: 0.0) }

        return .init(value: doubleValue / 100)
    }

    var currencyString: String {
        return NumberFormatter.currency.string(from: self.number)!
    }
}
