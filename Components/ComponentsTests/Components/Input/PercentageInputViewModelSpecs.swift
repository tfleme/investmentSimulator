import Quick
import Nimble

@testable import Components

final class PercentageInputViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        describe("PercentageInputViewModel") {
            
            let viewModel = PercentageInputViewModel()
            
            describe("init") {
                context("when property is called") {
                    it("it initializers properties propertly") {
                        
                        expect(viewModel.keyboardType).to(equal(.numberPad))
                        expect(viewModel.mask).to(equal("%"))
                    }
                }
            } // init
            
            describe("maskedText(_:forReplacementString:in:)") {
                context("when method is called adding and removing characters") {
                    it("handles masking logic") {
                        
                        let range = NSRange(location: 0, length: 1)
                        expect(viewModel.maskedText("", forReplacementString: "1", in: range)).to(equal("1%"))
                        expect(viewModel.maskedText("", forReplacementString: "4", in: range)).to(equal("14%"))
                        expect(viewModel.maskedText("", forReplacementString: "", in: range)).to(equal("1%"))
                        expect(viewModel.maskedText("", forReplacementString: "", in: range)).to(equal(""))
                    }
                }
            } // maskedText(_:forReplacementString:in:)
            
            describe("memory leak") {
                context("when PercentageInputViewModel is attributed to a weak reference") {
                    it("it's weak reference should be nil") {
                        
                        var viewModel: PercentageInputViewModel? = PercentageInputViewModel()

                        weak var leakReference = viewModel
                        viewModel = nil
                        
                        expect(leakReference).to(beNil())
                    }
                }
            } // memory leak
        }
    }
}
