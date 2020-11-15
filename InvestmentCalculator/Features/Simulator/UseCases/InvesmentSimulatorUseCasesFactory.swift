import Foundation

protocol InvesmentSimulationUseCasesFactory {
    func makeInvesmentSimulatonUseCases() -> InvesmentSimulationUseCasesType
}

extension DependencyContainer: InvesmentSimulationUseCasesFactory {
    
    func makeInvesmentSimulatorUseCases() -> InvesmentSimulationUseCasesType {
        
    }
}
