import Foundation
import NetworkPackage

protocol InvesmentSimulationServiceFactory {
    func makeInvesmentSimulationService() -> InvesmentSimulationServiceType
}

extension DependencyContainer: InvesmentSimulationServiceFactory {

    func makeInvesmentSimulationService() -> InvesmentSimulationServiceType {
        return InvesmentSimulationService(network: NetworkAdapter())
    }
}
