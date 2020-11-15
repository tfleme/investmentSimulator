import Foundation
import RxSwift

public protocol ReactiveNetworkAdapterType {
    func call(_ request: NetworkRequest) -> Observable<Data>
}

public protocol NetworkAdapterType {
    func call(_ request: NetworkRequest, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

public final class NetworkAdapter {
    
    // MARK: - Private methods

    #warning("Tiago Leme: timeout logic needs to be implemented.")
    private let timeoutInterval: TimeInterval
    private let urlSession: URLSession
    
    // MARK: - Initializers
    
    public init(urlSession: URLSession = URLSession.shared, timeoutInterval: TimeInterval = 30.0) {
        
        self.timeoutInterval = timeoutInterval
        self.urlSession = urlSession
    }
}

// MARK: - NetworkAdapterType

extension NetworkAdapter: NetworkAdapterType {
    
    public func call(_ request: NetworkRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    
        urlSession.dataTask(with: urlRequest(request)) { [weak self] result in
            
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    self?.debugResponse(data)
                    completion(.failure(NetworkError.invalidResponse))
                    return
                }
  
                self?.debugResponse(data)
                
                completion(.success(data))
            case .failure(let error):
                completion(.failure(NetworkError(error: error)))
            }
        }.resume()
    }
}

// MARK: - ReactiveNetworkAdapterType

extension NetworkAdapter: ReactiveNetworkAdapterType {
    
    public func call(_ request: NetworkRequest) -> Observable<Data> {
        
        return Observable.create { observer in
            
            let task = self.urlSession.dataTask(with: self.urlRequest(request)) { [weak self] result in
                
                switch result {
                case .success(let response, let data):
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                        self?.debugResponse(data)
                        observer.onError(NetworkError.invalidResponse)
                        return
                    }
                    
                    self?.debugResponse(data)
                    
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(NetworkError.network(error.localizedDescription))
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}


// MARK: - Private methods - Helpers

extension NetworkAdapter {
    
    private func urlRequest(_ request: NetworkRequest) -> URLRequest {
        
        var urlRequest = URLRequest(
            url: request.url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: timeoutInterval)
        
        urlRequest.httpMethod = request.endpoint.httpMethod.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = data(for: request.body)
        
        if let headers = request.headers {
            headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        
        debugRequest(urlRequest)
        
        return urlRequest
    }
    
    private func data(for dictionary: [String : Any]?) -> Data? {
        guard
            let dictionary = dictionary,
            let data = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        else { return nil }
        
        return data
    }
}

// MARK: - Private methods - Debug

extension NetworkAdapter {
    
    private func debugRequest(_ request: URLRequest) {
        
        #if DEBUG
            print("\nEndpoint:{\n\t\(request.debugDescription)\n}")
            print("Headers:{\n\t\(request.allHTTPHeaderFields?.debugDescription ?? "")\n}")
            if let data = request.httpBody {
                print("Body:{\n\t\(String(data: data, encoding: .utf8) ?? "")\n}")
            }
            print("")
        #endif
    }
    
    private func debugResponse(_ data: Data) {
        
        #if DEBUG
            print("Result: \(String(data: data, encoding: .utf8) ?? "")\n")
        #endif
    }
}

extension URLSession {
    
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        
        return dataTask(with: url) { (data, response, error) in
                if let error = error {
                    result(.failure(error))
                    return
                }
                guard let response = response, let data = data else {
                    let error = NSError(domain: "error", code: 0, userInfo: nil)
                    result(.failure(error))
                    return
                }
                result(.success((response, data)))
            }
    }
    
    func dataTask(
        with urlRequest: URLRequest,
        result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        
        return dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
