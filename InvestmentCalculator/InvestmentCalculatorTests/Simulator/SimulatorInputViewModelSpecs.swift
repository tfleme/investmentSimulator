import Foundation
import Quick
import Nimble
import RxSwift
import RxCocoa

@testable import InvestmentCalculator

final class SimulatorInputViewModelSpecs: QuickSpec {
    // swiftlint:disable function_body_length
    override func spec() {

        describe("SimulatorInputViewModel") {

            let delegate = SimulatorInputViewModelDelegateStub()
            let useCases = InvesmentSimulationUseCasesStub()

            let viewModel = SimulatorInputViewModel(delegate: delegate, useCases: useCases)

            describe("init") {
                context("when method is called") {
                    it("initializes properties properly") {

                        expect(viewModel.amountViewModel.title).to(equal("Quanto você gostaria de aplicar? *"))
                        expect(viewModel.amountViewModel.placeholder).to(equal("R$"))

                        expect(viewModel.expirationDateViewModel.title)
                            .to(equal("Qual a data de vencimento do investimento? *"))
                        expect(viewModel.expirationDateViewModel.placeholder).to(equal("dia/mês/ano"))
                        expect(viewModel.expirationDateViewModel.errorText).to(equal("Data inválida."))
                        expect(viewModel.expirationDateViewModel.keyboardType).to(equal(.numberPad))
                        expect(viewModel.expirationDateViewModel.mask).to(equal("##/##/####"))

                        expect(viewModel.investmentPerformanceViewModel.title)
                            .to(equal("Qual o percentual do CDI do investimento? *"))
                        expect(viewModel.investmentPerformanceViewModel.placeholder).to(equal("100%"))

                        expect(viewModel.buttonTitle).to(equal("Simular"))
                    }
                }
            } // init

            describe("isButtonEnabled") {
                context("when all data are input properly") {
                    it("returns true") {

                        viewModel.amountViewModel.text.accept("R$1000,00")
                        viewModel.expirationDateViewModel.text.accept("14/12/9999")
                        viewModel.investmentPerformanceViewModel.text.accept("123%")

                        expect(viewModel.isButtonEnabled.value).toEventually(beTrue())
                    }
                }

                context("when data are not input properly") {
                    it("returns true") {

                        viewModel.amountViewModel.text.accept(nil)
                        viewModel.expirationDateViewModel.text.accept(nil)
                        viewModel.investmentPerformanceViewModel.text.accept(nil)

                        expect(viewModel.isButtonEnabled.value).toEventually(beFalse())
                    }
                }
            } // isButtonEnabled

            describe("simulate()") {

                beforeEach {
                    viewModel.amountViewModel.text.accept("R$1000,00")
                    viewModel.expirationDateViewModel.text.accept("14/12/9999")
                    viewModel.investmentPerformanceViewModel.text.accept("123%")
                    delegate.numberOfDidSimulateCalls = 0
                }

                context("when method is called with nil parameters") {
                    it("falls thru") {

                        viewModel.amountViewModel.text.accept(nil)
                        viewModel.buttonTap.accept(())
                        expect(delegate.numberOfDidSimulateCalls).to(equal(0))
                    }
                }

                context("when method is called with failure") {
                    it("catches error") {

                        useCases.simulateResult = .error(DomainError.generic)
                        viewModel.buttonTap.accept(())
                        expect(delegate.numberOfDidSimulateCalls).to(equal(0))
                    }
                }

                context("when method is called with success") {
                    it("calls delegate method") {

                        useCases.simulateResult = .just(.mock())
                        viewModel.buttonTap.accept(())
                        expect(delegate.numberOfDidSimulateCalls).to(equal(1))
                    }
                }
            } // simulate()

            describe("memory leak") {
                context("when SimulatorInputViewModel is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        var viewModel: SimulatorInputViewModel? = SimulatorInputViewModel(
                            delegate: delegate,
                            useCases: useCases)

                        weak var leakReference = viewModel
                        viewModel = nil

                        expect(leakReference).to(beNil())
                    }
                }

                context("when SimulatorInputController is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        let viewModel = SimulatorInputViewModel(delegate: delegate, useCases: useCases)
                        var viewController: SimulatorInputController? = SimulatorInputController(viewModel: viewModel)

                        weak var leakReference = viewController
                        viewController = nil

                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}

// MARK: - SimulatorInputViewModelDelegateStub

final class SimulatorInputViewModelDelegateStub: SimulatorInputViewModelDelegate {

    var numberOfDidSimulateCalls = 0

    func didSimulate(with detail: InvestmentDetail) {
        numberOfDidSimulateCalls += 1
    }
}

// MARK: - InvesmentSimulationUseCasesStub

final class InvesmentSimulationUseCasesStub: InvesmentSimulationUseCasesType {

    var simulateResult: Observable<InvestmentDetail> = .error(DomainError.generic)

    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
        return simulateResult
    }

    func validDate(fromAppString string: String?) -> Date? {
        return Date(withAppString: string)
    }
}
