import Foundation

extension DateFormatter {
    
    static var appDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "pt-br")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }
    
    static var backendDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "pt-br")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
}
