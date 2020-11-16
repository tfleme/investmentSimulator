import Foundation

protocol InvesmentSimulationUseCasesFactory {
    func makeInvesmentSimulationUseCases() -> InvesmentSimulationUseCasesType
}

extension DependencyContainer: InvesmentSimulationUseCasesFactory {

    func makeInvesmentSimulationUseCases() -> InvesmentSimulationUseCasesType {
        return InvesmentSimulationUseCases()//service: makeInvesmentSimulationService())
    }
}
