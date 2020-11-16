import Foundation

struct InvestmentDetail: Codable {

    let investmentParameter: InvestmentParameter
    let grossAmount: Decimal
    let taxesAmount: Decimal
    let netAmount: Decimal
    let grossAmountProfit: Decimal
    let netAmountProfit: Decimal
    let annualGrossRateProfit: Decimal
    let monthlyGrossRateProfit: Decimal
    let dailyGrossRateProfit: Decimal
    let taxesRate: Decimal
    let rateProfit: Decimal
    let annualNetRateProfit: Decimal
}

// MARK: - InvestmentDetail inner type - InvestmentParameter

extension InvestmentDetail {

    struct InvestmentParameter: Codable {

        let investedAmount: Decimal
        let yearlyInterestRate: Decimal
        let maturityTotalDays: Int
        let maturityBusinessDays: Int
        let maturityDate: Date
        let rate: Decimal
        let isTaxFree: Bool
    }
}
