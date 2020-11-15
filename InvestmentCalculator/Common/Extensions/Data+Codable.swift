import Foundation

// MARK: - Decodable

extension Data {
    
    func decoded<T: Decodable>(
        decoder: JSONDecoder = .init(),
        debugging: Bool = true) -> T? {
        
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            if debugging { print(error) }
            return nil
        }
    }
}

// MARK: - Encodable

extension Data {
    
    init?<T: Encodable>(
        _ model: T,
        encoder: JSONEncoder = .init(),
        debugging: Bool = true) {
        
        do {
            self = try encoder.encode(model)
        } catch {
            if debugging { print(error) }
            return nil
        }
    }
}
