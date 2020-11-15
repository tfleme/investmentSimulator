import Foundation

enum DomainError: Error {
    case generic
    case parsing(Error)
}
