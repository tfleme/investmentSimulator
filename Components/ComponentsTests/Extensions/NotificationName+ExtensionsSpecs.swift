import UIKit
import Quick
import Nimble

@testable import Components

final class NotificationName_ExtensionsSpecs: QuickSpec {
    
    override func spec() {
        
        describe("NotificationName+Extensions") {
            
            describe("keyboardWillHide") {
                context("when property is called") {
                    it("returns a keyboardWillHideNotification name") {
                        expect(Notification.Name.keyboardWillHide.rawValue)
                            .to(equal("UIKeyboardWillHideNotification"))
                    }
                }
            } // keyboardWillHide
            
            describe("keyboardWillChangeFrame") {
                context("when property is called") {
                    it("returns a keyboardWillChangeFrame name") {
                        expect(Notification.Name.keyboardWillChangeFrame.rawValue)
                            .to(equal("UIKeyboardWillChangeFrameNotification"))
                    }
                }
            } // keyboardWillChangeFrame
        }
    }
}
