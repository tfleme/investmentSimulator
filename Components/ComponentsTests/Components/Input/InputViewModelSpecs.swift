import Quick
import Nimble

@testable import Components

final class InputViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        describe("InputViewModel") {

            describe("maskedText(_:forReplacementString:in:)") {
                context("when method is called with mask") {
                    it("handles masking logic") {
                        
                        let viewModel = InputViewModel(mask: "##/##/####")
                        let range = NSRange(location: 0, length: 2)
                        expect(viewModel.maskedText("14", forReplacementString: "141", in: range)).to(equal("14/1"))
                    }
                }
                
                context("when method is called without mask") {
                    it("returns unmasked string") {
                        
                        let viewModel = InputViewModel()
                        let range = NSRange(location: 0, length: 2)
                        expect(viewModel.maskedText("14", forReplacementString: "141", in: range)).to(equal("141"))
                    }
                }
            } // maskedText(_:forReplacementString:in:)
            
            describe("memory leak") {
                context("when InputViewModel is attributed to a weak reference") {
                    it("it's weak reference should be nil") {
                        
                        var viewModel: InputViewModel? = InputViewModel()

                        weak var leakReference = viewModel
                        viewModel = nil
                        
                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}
