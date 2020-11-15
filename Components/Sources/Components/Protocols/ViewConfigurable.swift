import Foundation

public protocol ViewConfigurable {
    
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
    func setupViews()
}

// MARK: - Default implementation

extension ViewConfigurable {
    
    public func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        setupViews()
    }
}
