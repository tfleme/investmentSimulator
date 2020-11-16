import Foundation
import Quick
import Nimble

@testable import InvestmentCalculator

final class DateExtensionsSpecs: QuickSpec {

    override func spec() {

        describe("Date+Extensions") {

            describe("init?(withAppString:)") {
                context("when method is called with a valid date string") {
                    it("returns a valid date object") {

                        expect(Date(withAppString: "14/12/1991")).toNot(beNil())
                    }
                }

                context("when method is called with an invalid date string") {
                    it("returns nil") {

                        expect(Date(withAppString: "absdhdjs")).to(beNil())
                    }
                }
            } // init?(withAppString:)

            describe("appString") {
                context("when property is called") {
                    it("returns a valid date string") {

                        let date = Date(withAppString: "14/12/1991")
                        expect(date?.appString).to(equal("14/12/1991"))
                    }
                }
            } // appString

            describe("backendString") {
                context("when property is called") {
                    it("returns a valid date string") {

                        let date = Date(withAppString: "14/12/1991")
                        expect(date?.backendString).to(equal("1991-12-14"))
                    }
                }
            } // backendString
        }
    }
}
