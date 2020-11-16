import Foundation

extension NumberFormatter {

    public static var currency: NumberFormatter {

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        return numberFormatter
    }

    public static var percentage: NumberFormatter {

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale(identifier: "pt_BR")
        return numberFormatter
    }
}
