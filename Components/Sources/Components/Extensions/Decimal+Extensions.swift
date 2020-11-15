import Foundation

extension Decimal {
    
    public init?(fromCurrencyString string: String?) {
        guard
            let string = string,
            let number = NumberFormatter.currency.number(from: string)
        else { return nil }
        
        self = number.decimalValue
    }
    
    public var currencyString: String {
        return NumberFormatter.currency.string(from: self as NSDecimalNumber)!
    }
}
