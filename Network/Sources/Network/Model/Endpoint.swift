import Foundation

public struct Endpoint {

    public enum HttpMethod: String {
        case post = "POST"
        case get = "GET"
        case put = "PUT"
    }

    // MARK: - Internal properties

    public let httpMethod: HttpMethod
    public let url: URL

    // MARK: - Initialization

    public init(httpMethod: HttpMethod, urlString: String) {
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL string: \(urlString)")
        }

        self.url = url
        self.httpMethod = httpMethod
    }
}
