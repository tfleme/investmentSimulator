import Foundation

public struct NetworkRequest {
    
    public let endpoint: Endpoint
    public let body: [String: Any]?
    public let headers: [String: String]?
    
    public init(endpoint: Endpoint,
         body: [String: Any]? = nil,
         headers: [String: String]? = nil) {
        
        self.endpoint = endpoint
        self.body = body
        self.headers = headers
    }
}

