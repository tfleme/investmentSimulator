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
            } // formatted(withMask:)
        }
    }
}
