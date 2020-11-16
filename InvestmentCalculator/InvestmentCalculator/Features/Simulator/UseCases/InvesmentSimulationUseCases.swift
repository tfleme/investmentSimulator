import Foundation
import RxSwift

protocol InvesmentSimulationUseCasesType {
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail>
}

final class InvesmentSimulationUseCases: InvesmentSimulationUseCasesType {

    // MARK: - Private properties

//    private let service: InvesmentSimulationServiceType
//
//    // MARK: - Initializers
//
//    init(service: InvesmentSimulationServiceType) {
//
//        self.service = service
//    }

    // MARK: - Public methods

    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
//        return service.simulate(with: parameters)
        return .error(DomainError.generic)
    }
}
