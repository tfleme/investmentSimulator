import Foundation
import RxSwift

protocol InvesmentSimulatorUseCasesType {
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail>
}

final class InvesmentSimulatorUseCases: InvesmentSimulatorUseCasesType {
    
    // MARK: - Private properties
    
    private let service: InvesmentSimulatorServiceType
    
    // MARK: - Initializers
    
    init(service: InvesmentSimulatorServiceType) {
        
        self.service = service
    }
    
    // MARK: - Public methods
    
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
        return service.simulate(with: parameters)
    }
}
