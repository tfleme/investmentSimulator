import UIKit
import Components

final class InvestmentSimulationDetailView: UIView, ViewStackable {

    // MARK: - Private properties

    private let scrollView = UIScrollView()

    // MARK: - Public properties

    let stackView = UIStackView()

    // MARK: - Public properties

    let button = Button()

    // MARK: - Initializers

    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewConfiguration

extension InvestmentSimulationDetailView: ViewConfigurable {

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

extension InvestmentSimulationDetailView {

    private func setupScrollViewConstraints() {

        [
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24.0),
            scrollView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -24.0)
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

extension InvestmentSimulationDetailView {

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.spacing = 40.0
        stackView.distribution = .equalSpacing
    }
}
