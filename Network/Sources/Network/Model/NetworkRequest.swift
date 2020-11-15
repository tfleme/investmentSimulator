import Foundation

public struct NetworkRequest {
    
    // MARK: - Private properties
    
    private var urlComponents: URLComponents? {
        
        var urlComponents = URLComponents(string: endpoint.url.absoluteString)
        urlComponents?.queryItems = queryItems
        return urlComponents
    }
    
    private var queryItems: [URLQueryItem] {
        guard let parameters = parameters else { return [] }
        
        return parameters.map { URLQueryItem(name: $0, value: "\($1)") }
    }
    
    // MARK: - Public properties
    
    public let endpoint: Endpoint
    public let body: [String: Any]?
    public let parameters: [String: Any]?
    public let headers: [String: String]?
    
    // MARK: - Internal properties
    
    var url: URL {
        guard let url = urlComponents?.url else { return endpoint.url }
        
        return url
    }
    
    // MARK: - Initializers
    
    public init(endpoint: Endpoint,
                parameters: [String: Any]?,
                body: [String: Any]? = nil,
                headers: [String: String]? = nil) {
        
        self.endpoint = endpoint
        self.parameters = parameters
        self.body = body
        self.headers = headers
    }
}

