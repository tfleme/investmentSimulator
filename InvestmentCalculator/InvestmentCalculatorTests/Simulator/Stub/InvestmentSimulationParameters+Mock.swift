import Foundation

@testable import InvestmentCalculator

// MARK: - Mock extension

extension InvestmentSimulationParameters {

    static func mock() -> InvestmentSimulationParameters {
        return InvestmentSimulationParameters(
            amount: 1000.0,
            expirationDate: Date(withAppString: "14/12/9999")!,
            performance: 123)!
    }
}
