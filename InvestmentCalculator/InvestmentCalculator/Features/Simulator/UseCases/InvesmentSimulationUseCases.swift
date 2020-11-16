import Foundation
import RxSwift

protocol InvesmentSimulatorUseCasesType {
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail>
}

protocol InvestmentExpirationDateUseCasesType {
    func validDate(fromAppString string: String?) -> Date?
}

typealias InvesmentSimulationUseCasesType =
    InvesmentSimulatorUseCasesType &
    InvestmentExpirationDateUseCasesType

final class InvesmentSimulationUseCases: InvesmentSimulationUseCasesType {

    // MARK: - Private properties

    private let service: InvesmentSimulationServiceType

    // MARK: - Initializers

    init(service: InvesmentSimulationServiceType) {

        self.service = service
    }
}

// MARK: - InvesmentSimulatorUseCasesType

extension InvesmentSimulationUseCases {

    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
        return service.simulate(with: parameters)
    }
}

// MARK: - InvestmentExpirationDateUseCasesType

extension InvesmentSimulationUseCases {

    func validDate(fromAppString string: String?) -> Date? {
        guard
            let string = string,
            let date = Date(withAppString: string),
            date > Date()
        else { return nil }

        return date
    }
}
