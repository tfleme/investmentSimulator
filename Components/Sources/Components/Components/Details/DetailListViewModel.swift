import Foundation

public struct DetailListViewModel {

    // MARK: - Public properties
    
    public let detailViewModels: [DetailViewModel]
    
    // MARK: - Initializers
    
    public init(detailViewModels: [DetailViewModel]) {
        
        self.detailViewModels = detailViewModels
    }
}
