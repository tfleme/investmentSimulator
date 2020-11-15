import UIKit

public final class DetailView: UIView {
    
    // MARK: - Private properties
    
    private let titleLabel = Label(textStyle: .body, textColor: .mediumGray, textAlignment: .left)
    private let valueLabel = Label(textStyle: .body, textColor: .darkGray, textAlignment: .right)
    
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

extension DetailView {
    
    public func configure(with viewModel: DetailViewModel) {
        
        self.titleLabel.text = viewModel.title
        self.valueLabel.text = viewModel.value
    }
}

// MARK: - ViewConfigurable

extension DetailView: ViewConfigurable {
    
    public func buildViewHierarchy() {
        
        addSubviews([titleLabel, valueLabel])
    }
    
    public func setupConstraints() {
        
        setupTitleLabelConstraints()
        setupValueLabelConstraints()
    }
    
    public func setupViews() {
        
        setupTitleLabel()
        setupValueLabel()
    }
}

// MARK: - Private methods - Constraints

extension DetailView {
    
    private func setupTitleLabelConstraints() {
        
        [
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor)
        ].activate()
    }
    
    private func setupValueLabelConstraints() {
        
        [
            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8.0),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].activate()
    }
}

// MARK: - Private methods - Setup

extension DetailView {
    
    private func setupTitleLabel() {
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private func setupValueLabel() {
        
        valueLabel.setContentHuggingPriority(.required, for: .horizontal)
        valueLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}

// MARK: - ViewStackable

extension ViewStackable {
    
    public func addStackableView(with viewModel: DetailViewModel) {
        
        let view = DetailView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}


