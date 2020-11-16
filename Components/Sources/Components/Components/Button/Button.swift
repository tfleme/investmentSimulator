import UIKit
import RxSwift
import RxRelay

public final class Button: UIButton {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()
    private lazy var heightConstraint = heightAnchor.constraint(equalToConstant: 44.0)

    // MARK: - Public properties

    public let isLoading = BehaviorRelay<Bool>(value: false)

    // MARK: - Initializers

    public init() {
        super.init(frame: .zero)
        setupViewConfiguration()
        setupObservables()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    public override func layoutSubviews() {
        super.layoutSubviews()

        setupCornerRadius()
    }

    public override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .primaryGreen : .lightGray
            isUserInteractionEnabled = isEnabled
        }
    }
}

// MARK: - Public methods

extension Button {

    public func showLoading() {
        isUserInteractionEnabled = false
        titleLabel?.layer.opacity = 0.0
        let activityIndicator = UIActivityIndicatorView(style: .white)
        addSubviews([activityIndicator])
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.startAnimating()
    }

    public func hideLoading() {
        guard let activityIndicator = subviews.last as? UIActivityIndicatorView else { return }

        isUserInteractionEnabled = true
        activityIndicator.removeFromSuperview()
        titleLabel?.layer.opacity = 1.0
    }
}

// MARK: - ViewConfigurable

extension Button: ViewConfigurable {

    public func buildViewHierarchy() {}

    public func setupConstraints() {

        heightConstraint.isActive = true
    }

    public func setupViews() {

        backgroundColor = .primaryGreen
    }
}

// MARK: - Private methods - Setup

extension Button {

    private func setupCornerRadius() {

        layer.cornerRadius = heightConstraint.constant / 2
    }
}

// MARK: - Private methods - Binding

extension Button {

    private func setupObservables() {

        isLoading
            .subscribe(onNext: { [weak self] in $0 ? self?.showLoading() : self?.hideLoading() })
            .disposed(by: disposeBag)
    }
}
