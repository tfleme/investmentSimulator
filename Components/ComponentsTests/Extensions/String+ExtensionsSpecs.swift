import Foundation
import Quick
import Nimble

@testable import Components

final class String_ExtensionsSpecs: QuickSpec {
    
    override func spec() {
        
        describe("String+Extensions") {
            
            describe("formatted(withMask:)") {
                context("when method is called with valid mask") {
                    it("returns the masked value") {
                        
                        let mask = "##/##/####"
                        expect("14122020".formatted(withMask: mask)).to(equal("14/12/2020"))
                    }
                }
                
                context("when method is called with a nil mask") {
                    it("returns the unmasked value") {
                        
                        expect("14122020".formatted(withMask: nil)).to(equal("14122020"))
                    }
                }
            } // formatted(withMask:)
            
            describe("number") {
                context("when property is called with a valid numbered string") {
                    it("returns the casted number") {
                        
                        expect("12345".number).to(equal(123.45))
                    }
                }
                
                context("when property is called with an invalid numbered string") {
                    it("returns zero") {
                        
                        expect("a1b3c4d5e".number).to(equal(0))
                    }
                }
            } // number
            
            describe("currencyString") {
                context("when property is called with a valid currency string") {
                    it("returns the formatted string") {
                        
                        expect("12345".currencyString).to(equal("R$ 123,45"))
                    }
                }
                
                context("when property is called with an invalid currency string") {
                    it("returns R$ 0,00") {
                        
                        expect("-234".currencyString).to(equal("-R$ 2,34"))
                    }
                }
            } // currencyString
        }
    }
}
