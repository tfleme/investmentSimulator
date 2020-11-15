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
    
    public var percentString: String {
        let percent = self / 100
        return NumberFormatter.percentage.string(from: percent as NSDecimalNumber)!
    }
}
