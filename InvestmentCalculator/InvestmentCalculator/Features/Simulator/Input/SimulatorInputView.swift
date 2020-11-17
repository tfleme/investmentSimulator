import UIKit
import Components

final class SimulatorInputView: UIView, ViewStackable, KeyboardAdjustable {

    // MARK: - Private properties

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // MARK: - Public properties

    let stackView = UIStackView()

    lazy var keyboardLayoutGuideBottomConstraint = scrollView.bottomAnchor.constraint(
        equalTo: safeAreaLayoutGuide.bottomAnchor)

    // MARK: - Public properties

    let button = Button()

    // MARK: - Initializers

    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
        setupKeyboardNotifications()
        setupAccessibilityLabels()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewConfiguration

extension SimulatorInputView: ViewConfigurable {

    func buildViewHierarchy() {

        addSubviews([scrollView])
        scrollView.addSubviews([contentView])
        contentView.addSubviews([stackView, button])
    }

    func setupConstraints() {

        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupStackViewConstraints()
        setupButtonConstraints()
    }

    func setupViews() {

        backgroundColor = .white

        setupStackView()
    }
}

// MARK: - Private methods - Constraints

extension SimulatorInputView {

    private func setupScrollViewConstraints() {

        [
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24.0),
            keyboardLayoutGuideBottomConstraint
        ].activate()
    }

    private func setupContentViewConstraints() {

        [
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, priority: 250)
        ].activate()
    }

    private func setupStackViewConstraints() {

        [
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24.0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ].activate()
    }

    private func setupButtonConstraints() {

        [
            button.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: 24.0),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24.0),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24.0),
            button.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -24.0)
        ].activate()
    }
}

// MARK: - Private methods - Setup

extension SimulatorInputView {

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.spacing = 40.0
        stackView.distribution = .equalSpacing
    }
}

// MARK: - Private methods - Accessibility

extension SimulatorInputView {

    private func setupAccessibilityLabels() {

        accessibilityLabel = "SimulatorInputView"
        button.accessibilityLabel = "SimulatorInputView.actionButton"
        button.isAccessibilityElement = true
    }
}
