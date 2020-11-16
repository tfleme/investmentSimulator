import Foundation
import RxSwift

// MARK: - Decodable

extension Data {

    func decoded<T: Decodable>() -> Observable<T> {

        do {
            return try .just(Self.decoder.decode(T.self, from: self))
        } catch {
            #if DEBUG
            print(error)
            #endif
            return .error(DomainError.parsing(error))
        }
    }
}

// MARK: - Encodable

extension Data {

    init?<T: Encodable>(_ model: T) {

        do {
            self = try Self.encoder.encode(model)
        } catch {
            #if DEBUG
            print(error)
            #endif
            return nil
        }
    }
}

// MARK: - JSONDecoder

extension Data {

    static var decoder: JSONDecoder {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Short)
        return decoder
    }

    static var encoder: JSONEncoder {

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Short)
        return encoder
    }
}
