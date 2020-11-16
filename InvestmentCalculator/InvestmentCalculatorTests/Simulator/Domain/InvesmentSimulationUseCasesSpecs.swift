import Quick
import Nimble
import RxSwift
import RxRelay

@testable import InvestmentCalculator

final class InvesmentSimulationUseCasesSpecs: QuickSpec {

    override func spec() {

        describe("InvesmentSimulationUseCases") {

            let disposeBag = DisposeBag()
            let service = InvesmentSimulationServiceStub()

            let useCases = InvesmentSimulationUseCases(service: service)

            describe("simulate(with:)") {
                context("when method is called success") {
                    it("returns the same output as service") {

                        let result = BehaviorRelay<InvestmentDetail?>(value: nil)

                        service.simulateResult = .just(.mock())
                        useCases.simulate(with: .mock()).bind(to: result).disposed(by: disposeBag)

                        expect(result.value?.grossAmount).to(equal(60528.20))
                        expect(result.value?.netAmountProfit).to(equal(24974.42))
                    }
                }

                context("when method is called failure") {
                    it("returns the same output as service") {

                        let error = BehaviorRelay<Error?>(value: nil)

                        service.simulateResult = .error(DomainError.generic)
                        useCases.simulate(with: .mock())
                            .do(onError: error.accept)
                            .subscribe()
                            .disposed(by: disposeBag)

                        expect(error.value).toNot(beNil())
                    }
                }
            } // simulate(with:)

            describe("memory leak") {
                context("when InvesmentSimulationUseCases is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        var useCases: InvesmentSimulationUseCases? = InvesmentSimulationUseCases(service: service)

                        weak var leakReference = useCases
                        useCases = nil

                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}

// MARK: - InvesmentSimulationServiceStub

final class InvesmentSimulationServiceStub: InvesmentSimulationServiceType {

    var simulateResult: Observable<InvestmentDetail> = .just(.mock())

    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
        return simulateResult
    }
}
