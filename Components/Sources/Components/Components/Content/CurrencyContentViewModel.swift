import Foundation

public struct CurrencyContentViewModel {

    // MARK: - Public properties

    public let title: String
    public let currency: String
    public let description: String

    // MARK: - Initializers

    public init(title: String, currency: String, description: String) {

        self.title = title
        self.currency = currency
        self.description = description
    }
}
