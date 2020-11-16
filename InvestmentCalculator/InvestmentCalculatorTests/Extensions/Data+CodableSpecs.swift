import Quick
import Nimble
import RxSwift
import RxRelay

@testable import InvestmentCalculator

final class DataCodableSpecs: QuickSpec {

    override func spec() {

        describe("Data+Codable") {

            let disposeBag = DisposeBag()
            let date = Date(withAppString: "01/01/2022")!

            describe("init") {
                context("when a valid data object is encoded") {
                    it("returns a valid data object") {

                        let model = Model(title: "title", description: "description", date: date)
                        let data = Data(model)

                        expect(data).toNot(beNil())
                    }
                }

                context("when a invalid data object is encoded") {
                    it("returns a nil data object") {

                        let model = InvalidModel(title: "title")
                        let data = Data(model)

                        expect(data).to(beNil())
                    }
                }
            } // init

            describe("decoded") {
                context("when a valid data object is decoded") {
                    it("returns a valid decoded object") {

                        let model = Model(title: "title", description: "description", date: date)
                        let data = Data(model)

                        let decodedModel = BehaviorRelay<Model?>(value: nil)

                        data!.decoded().bind(to: decodedModel).disposed(by: disposeBag)
                        expect(decodedModel.value).to(equal(model))
                    }
                }

                context("when a invalid data object is decoded") {
                    it("returns a nil object") {

                        let data = "".data(using: .utf8)

                        let decodedModel = BehaviorSubject<Model?>(value: nil)

                        data!.decoded().bind(to: decodedModel).disposed(by: disposeBag)

                        expect(try? decodedModel.value()).to(beNil())
                    }
                }
            } // decoded
        }
    }
}

// MARK: - Inner Types

extension DataCodableSpecs {

    struct Model: Codable, Equatable {
        let title: String
        let description: String
        let date: Date
    }

    struct InvalidModel: Codable {
        let title: String

        func encode(to encoder: Encoder) throws {
            throw DomainError.generic
        }
    }
}
