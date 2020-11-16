import Foundation
import RxSwift

// MARK: - Decodable

extension Data {

    func decoded<T: Decodable>() -> Observable<T> {

        do {
            return try .just(decoder.decode(T.self, from: self))
        } catch {
            #if DEBUG
            print(error)
            #endif
            return .error(DomainError.parsing(error))
        }
    }
}

// MARK: - JSONDecoder

extension Data {

    var decoder: JSONDecoder {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Short)
        return decoder
    }
}
