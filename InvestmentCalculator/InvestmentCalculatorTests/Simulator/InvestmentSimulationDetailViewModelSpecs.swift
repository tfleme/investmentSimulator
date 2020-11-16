import Quick
import Nimble
import RxSwift

@testable import InvestmentCalculator

final class InvestmentSimulationDetailViewModelSpecs: QuickSpec {
    // swiftlint:disable function_body_length
    override func spec() {

        describe("InvestmentSimulationDetailViewModel") {

            let delegate = InvestmentSimulationDetailViewModelDelegateStub()
            let viewModel = InvestmentSimulationDetailViewModel(delegate: delegate, detail: .mock())

            describe("summaryViewModel") {
                context("when property is called") {
                    it("returns proper values") {

                        expect(viewModel.summaryViewModel.title).to(equal("Resultado da simulação"))
                        expect(viewModel.summaryViewModel.currency).to(equal("R$ 60.528,20"))
                        expect(viewModel.summaryViewModel.description).to(equal("Rendimento total de R$ 28.295,29"))
                    }
                }
            } // summaryViewModel

            describe("parametersViewModel") {
                context("when property is called") {
                    it("returns proper values") {

                        let detailViewModels = viewModel.parametersViewModel.detailViewModels

                        expect(detailViewModels[0].title).to(equal("Valor aplicado inicialmente"))
                        expect(detailViewModels[0].value).to(equal("R$ 32.323,00"))
                        expect(detailViewModels[1].title).to(equal("Valor bruto do investimento"))
                        expect(detailViewModels[1].value).to(equal("R$ 60.528,20"))
                        expect(detailViewModels[2].title).to(equal("Valor do rendimento"))
                        expect(detailViewModels[2].value).to(equal("R$ 28.295,29"))
                        expect(detailViewModels[3].title).to(equal("IR sobre o investimento"))
                        expect(detailViewModels[3].value).to(equal("R$ 4.244,29 (15%)"))
                        expect(detailViewModels[4].title).to(equal("Valor líquido do investimento"))
                        expect(detailViewModels[4].value).to(equal("R$ 56.297,42"))
                    }
                }
            } // parametersViewModel

            describe("detailsViewModel") {
                context("when property is called") {
                    it("returns proper values") {

                        let detailViewModels = viewModel.detailsViewModel.detailViewModels

                        expect(detailViewModels[0].title).to(equal("Data de resgate"))
                        expect(detailViewModels[0].value).to(equal("14/12/9999"))
                        expect(detailViewModels[1].title).to(equal("Dias corridos"))
                        expect(detailViewModels[1].value).to(equal("1981"))
                        expect(detailViewModels[2].title).to(equal("Rendimento mensal"))
                        expect(detailViewModels[2].value).to(equal("0,76%"))
                        expect(detailViewModels[3].title).to(equal("Percentual do CDI do investimento"))
                        expect(detailViewModels[3].value).to(equal("123%"))
                        expect(detailViewModels[4].title).to(equal("Rentabilidade anual"))
                        expect(detailViewModels[4].value).to(equal("87,26%"))
                        expect(detailViewModels[5].title).to(equal("Rentabilidade no período"))
                        expect(detailViewModels[5].value).to(equal("9,55%"))
                    }
                }
            } // detailsViewModel

            describe("summaryViewModel") {
                context("when property is called") {
                    it("returns proper values") {

                        expect(viewModel.buttonTitle).to(equal("Simular novamente"))
                    }
                }
            } // summaryViewModel

            describe("buttonTap") {

                beforeEach {
                    delegate.numberOfDidSelectSimulateCalls = 0
                }

                context("when relay is called") {
                    it("calls delegate method") {

                        viewModel.buttonTap.accept(())
                        expect(delegate.numberOfDidSelectSimulateCalls).to(equal(1))
                    }
                }
            } // buttonTap

            describe("memory leak") {
                context("when InvestmentSimulationDetailViewModel is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        var viewModel: InvestmentSimulationDetailViewModel? = InvestmentSimulationDetailViewModel(
                            delegate: delegate,
                            detail: .mock())

                        weak var leakReference = viewModel
                        viewModel = nil

                        expect(leakReference).to(beNil())
                    }
                }

                context("when InvestmentSimulationDetailController is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        let viewModel = InvestmentSimulationDetailViewModel(delegate: delegate, detail: .mock())
                        var viewController: InvestmentSimulationDetailController?
                            = InvestmentSimulationDetailController(viewModel: viewModel)

                        weak var leakReference = viewController
                        viewController = nil

                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}

// MARK: - InvestmentSimulationDetailViewModelDelegateStub
// swiftlint:disable type_name
final class InvestmentSimulationDetailViewModelDelegateStub: InvestmentSimulationDetailViewModelDelegate {

    var numberOfDidSelectSimulateCalls = 0

    func didSelectSimulate() {
        numberOfDidSelectSimulateCalls += 1
    }
}
