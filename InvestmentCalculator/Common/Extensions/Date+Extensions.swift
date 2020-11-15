import Foundation

extension Date {
    
    init?(withString string: String?) {
        guard
            let string = string,
            let date = DateFormatter.appDateFormatter.date(from: string)
        else { return nil }
        
        self = date
    }
    
    var backendString: String {
        return DateFormatter.backendDateFormatter.string(from: self)
    }
}
