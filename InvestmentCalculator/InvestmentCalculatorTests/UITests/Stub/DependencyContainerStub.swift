import Foundation

@testable import InvestmentCalculator

final class DependencyContainerStub: AppCoordinator.Factory {

    // MARK: - Public properties

    let invesmentSimulationUseCases = InvesmentSimulationUseCasesStub()

    // MARK: - Public methods

    func makeInvesmentSimulationUseCases() -> InvesmentSimulationUseCasesType {
        return invesmentSimulationUseCases
    }
}
