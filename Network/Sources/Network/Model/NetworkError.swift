import Foundation

public enum NetworkError: Error {
    
    case network(String)
    case invalidResponse
    
    public var localizedDescription: String {
        
        switch self {
        case .invalidResponse:
            return "Service returned with an invalid response format."
        case .network(let description):
            return description
        }
    }
    
    public init(error: Error) {
        self = .network(error.localizedDescription)
    }
}
