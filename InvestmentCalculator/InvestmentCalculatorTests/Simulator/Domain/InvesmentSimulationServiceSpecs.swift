import Foundation
import Quick
import Nimble
import RxSwift
import NetworkPackage

@testable import InvestmentCalculator

final class InvesmentSimulationServiceSpecs: QuickSpec {

    override func spec() {

        describe("InvesmentSimulationService") {

            let disposeBag = DisposeBag()
            let network = ReactiveNetworkAdapterStub()

            let service = InvesmentSimulationService(network: network)

            describe("simulate(with:)") {
                context("when method is called") {
                    it("calls network.call(_:) method with proper parameters") {

                        network.result = .just(Data(InvestmentDetail.mock())!)
                        service.simulate(with: .mock()).subscribe().disposed(by: disposeBag)

                        expect(network.request?.endpoint.httpMethod).to(equal(.get))
                        expect(network.request?.endpoint.url.absoluteString)
                            .to(equal("https://api-simulator-calc.easynvest.com.br/calculator/simulate"))
                        expect(network.request?.parameters?["investedAmount"] as? Decimal).to(equal(1000.0))
                        expect(network.request?.parameters?["index"] as? String).to(equal("CDI"))
                        expect(network.request?.parameters?["rate"] as? Int).to(equal(123))
                        expect(network.request?.parameters?["isTaxFree"] as? Bool).to(beFalse())
                        expect(network.request?.parameters?["maturityDate"] as? String).to(equal("9999-12-14"))
                    }
                }
            } // simulate(with:)

            describe("memory leak") {
                context("when InvesmentSimulationService is attributed to a weak reference") {
                    it("it's weak reference should be nil") {

                        var service: InvesmentSimulationService? = InvesmentSimulationService(network: network)

                        weak var leakReference = service
                        service = nil

                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}

// MARK: - ReactiveNetworkAdapterStub

final class ReactiveNetworkAdapterStub: ReactiveNetworkAdapterType {

    var result: Observable<Data> = .error(DomainError.generic)
    var request: NetworkRequest?

    func call(_ request: NetworkRequest) -> Observable<Data> {
        self.request = request
        return result
    }
}
