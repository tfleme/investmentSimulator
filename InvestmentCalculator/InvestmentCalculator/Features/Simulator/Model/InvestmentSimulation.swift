import Foundation

struct InvestmentSimulationParameters {

    let amount: Decimal
    let expirationDate: Date
    let performance: Int

    init?(amount: Decimal?, expirationDate: Date?, performance: Int?) {
        guard
            let amount = amount,
            let expirationDate = expirationDate,
            let performance = performance
        else { return nil }

        self.amount = amount
        self.expirationDate = expirationDate
        self.performance = performance
    }
}
