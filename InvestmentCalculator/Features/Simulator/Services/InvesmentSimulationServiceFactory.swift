import Foundation
import Network

protocol InvesmentSimulationServiceFactory {
    func makeInvesmentSimulationService() -> InvesmentSimulationServiceType
}

extension DependencyContainer: InvesmentSimulationServiceFactory {

    func makeInvesmentSimulationService() -> InvesmentSimulationServiceType {
        return InvesmentSimulationService(network: NetworkAdapter())
    }
}
