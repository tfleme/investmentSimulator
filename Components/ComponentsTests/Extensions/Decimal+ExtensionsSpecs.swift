import Foundation
import Quick
import Nimble

@testable import Components

final class Decimal_ExtensionsSpecs: QuickSpec {
    
    override func spec() {
        
        describe("Decimal+Extensions") {
            
            describe("init?(fromCurrencyString:)") {
                context("when method is called with a valid currency string") {
                    it("the decimal value") {
                        
                        expect(Decimal(fromCurrencyString: "R$123,45")).to(equal(123.45))
                    }
                }
                
                context("when method is called with an invalid currency string") {
                    it("returns nil") {
                        
                        expect(Decimal(fromCurrencyString: "R$asd123,45")).to(beNil())
                    }
                }
            } // init?(fromCurrencyString:)
            
            describe("currencyString") {
                context("when property is called") {
                    it("returns a currency string") {

                        expect(Decimal(123.45).currencyString).to(equal("R$ 123,45"))
                    }
                }
            } // currencyString

            describe("percentString") {
                context("when property is called") {
                    it("returns the formatted string") {

                        expect(Decimal(123.45).percentString).to(equal("123,45%"))
                    }
                }
            } // percentString
        }
    }
}
