import UIKit

public final class DividerView: UIView {

    // MARK: - Initializers

    public init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewConfigurable

extension DividerView: ViewConfigurable {

    public func buildViewHierarchy() {}

    public func setupConstraints() {

        heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }

    public func setupViews() {

        backgroundColor = .lightestGray
    }
}
