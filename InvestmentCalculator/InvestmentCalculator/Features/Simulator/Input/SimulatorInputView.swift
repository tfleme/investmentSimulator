import UIKit
import Components

final class SimulatorInputView: UIView, ViewStackable, KeyboardAdjustable {

    // MARK: - Private properties

    private let scrollView = UIScrollView()

    // MARK: - Public properties

    let stackView = UIStackView()

    lazy var keyboardLayoutGuideBottomConstraint = scrollView.bottomAnchor.constraint(
        equalTo: button.topAnchor,
        constant: -24.0)

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

        addSubviews([scrollView, button])
        scrollView.addSubviews([stackView])
    }

    func setupConstraints() {

        setupScrollViewConstraints()
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

    private func setupStackViewConstraints() {

        [
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24.0),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24.0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -48.0)
        ].activate()
    }

    private func setupButtonConstraints() {

        [
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24.0)
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
