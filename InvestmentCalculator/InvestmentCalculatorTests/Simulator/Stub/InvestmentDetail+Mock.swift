import Foundation

@testable import InvestmentCalculator

// MARK: - Mock extension

extension InvestmentDetail {

    static func mock() -> InvestmentDetail {
        return InvestmentDetail(
            investmentParameter: InvestmentParameter(
                investedAmount: 32323.0,
                yearlyInterestRate: 9.5512,
                maturityTotalDays: 1981,
                maturityBusinessDays: 1409,
                maturityDate: Date(withAppString: "14/12/9999")!,
                rate: 123.0,
                isTaxFree: false),
            grossAmount: 60528.20,
            taxesAmount: 4230.78,
            netAmount: 56297.42,
            grossAmountProfit: 28295.29,
            netAmountProfit: 24974.42,
            annualGrossRateProfit: 87.26,
            monthlyGrossRateProfit: 0.76,
            dailyGrossRateProfit: 0.000445330025305748,
            taxesRate: 15.0,
            rateProfit: 9.5512,
            annualNetRateProfit: 74.17)
    }
}
