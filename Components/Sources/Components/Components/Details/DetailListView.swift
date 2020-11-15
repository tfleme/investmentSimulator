import UIKit

public final class DetailListView: UIView, ViewStackable {
    
    // MARK: - Public properties
    
    public let stackView = UIStackView()
    
    // MARK: - Initializers
    
    public init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension DetailListView {
    
    public func configure(with viewModel: DetailListViewModel) {
        
        viewModel.detailViewModels.forEach(addStackableView)
    }
}

// MARK: - ViewConfigurable

extension DetailListView: ViewConfigurable {
    
    public func buildViewHierarchy() {
        
        addSubviews([stackView])
    }
    
    public func setupConstraints() {
        
        [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].activate()
    }
    
    public func setupViews() {
        
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.distribution = .equalSpacing
    }
}

// MARK: - ViewStackable

extension ViewStackable {
    
    public func addStackableView(with viewModel: DetailListViewModel) {
        
        let view = DetailListView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}
