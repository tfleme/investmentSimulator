import Foundation

extension Date {
    
    init?(withString string: String?) {
        guard
            let string = string,
            let date = DateFormatter.app.date(from: string)
        else { return nil }
        
        self = date
    }
    
    var appString: String {
        return DateFormatter.app.string(from: self)
    }
    
    var backendString: String {
        return DateFormatter.backend.string(from: self)
    }
}
