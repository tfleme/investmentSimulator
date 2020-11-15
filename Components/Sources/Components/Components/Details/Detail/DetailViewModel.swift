import Foundation

public struct DetailViewModel {
    
    // MARK: - Public properties
    
    public let title: String
    public let value: String
    
    // MARK: - Initializers
    
    public init(title: String, value: String) {
        
        self.title = title
        self.value = value
    }
}
