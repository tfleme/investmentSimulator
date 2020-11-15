import UIKit

public final class CurrencyContentView: UIView {
    
    // MARK: - Private properties
    
    private let stackView = UIStackView()
    
    private let titleLabel = Label(textStyle: .callout, textColor: .mediumGray)
    private let currencyLabel = Label(textStyle: .largeTitle, textColor: .darkGray)
    private let descriptionLabel = Label(textStyle: .callout, textColor: .lightGray)
    
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

extension CurrencyContentView {
    
    public func configure(with viewModel: CurrencyContentViewModel) {
        
        titleLabel.text = viewModel.title
        currencyLabel.text = viewModel.currency
        descriptionLabel.text = viewModel.description
    }
}

// MARK: - ViewConfigurable

extension CurrencyContentView: ViewConfigurable {
    
    public func buildViewHierarchy() {
        
        addSubviews([stackView])
        stackView.addArrangedSubviews([titleLabel, currencyLabel, descriptionLabel])
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
        stackView.alignment = .center
    }
}

// MARK: - ViewStackable

extension ViewStackable {
    
    public func addStackableView(with viewModel: CurrencyContentViewModel) {
        
        let view = CurrencyContentView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}
