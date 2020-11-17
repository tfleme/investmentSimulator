import UIKit
import RxSwift
import RxCocoa

public class InputView: UIView {

    // MARK: - Private properties

    private let disposeBag = DisposeBag()

    private let stackView = UIStackView()
    private let titleLabel = Label(textStyle: .callout, textColor: .mediumGray)
    private let textfield = UITextField()
    private let dividerView = DividerView()
    private let errorLabel = Label(textStyle: .callout, textColor: .alertRed)
    private let toolbar = SimpleToolbarView(doneButtonTitle: "Ok")
    private let tapGesture = UITapGestureRecognizer()

    private var viewModel: InputViewModel?

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

extension InputView {

    public func configure(with viewModel: InputViewModel) {

        titleLabel.text = viewModel.title
        errorLabel.text = viewModel.errorText

        textfield.placeholder = viewModel.placeholder
        textfield.keyboardType = viewModel.keyboardType
        textfield.delegate = viewModel.mask != nil ? self : nil
        
        accessibilityLabel = viewModel.accessibilityLabel

        setupObservables(with: viewModel)
        self.viewModel = viewModel
    }
}

// MARK: - ViewConfigurable

extension InputView: ViewConfigurable {

    public func buildViewHierarchy() {

        addSubviews([stackView])
        stackView.addArrangedSubviews([titleLabel, textfield, dividerView, errorLabel])
    }

    public func setupConstraints() {

        [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].activate()

        dividerView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }

    public func setupViews() {

        addGestureRecognizer(tapGesture)

        setupStackView()
        setupTextField()
    }
}

// MARK: - Private methods - Setup

extension InputView {

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
    }

    private func setupTextField() {

        textfield.textAlignment = .center
        textfield.textColor = .darkGray
        textfield.font = .preferredFont(forTextStyle: .title1)
        textfield.inputAccessoryView = toolbar
        textfield.autocorrectionType = .no
    }
}

// MARK: - Private methods - Binding

extension InputView {

    private func setupObservables(with viewModel: InputViewModel) {

        tapGesture.rx.event
            .map { _ in }
            .subscribe(onNext: { [weak self] in self?.textfield.becomeFirstResponder() })
            .disposed(by: disposeBag)

        viewModel.isInputValid
            .bind(to: errorLabel.rx.isHidden)
            .disposed(by: disposeBag)

        textfield.rx.text
            .bind(to: viewModel.text)
            .disposed(by: disposeBag)

        toolbar.doneButtonTap
            .do(onNext: { [weak self] in self?.textfield.resignFirstResponder() })
            .compactMap { [weak self] in self?.textfield.text }
            .bind(to: viewModel.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - UITextFieldDelegate

extension InputView: UITextFieldDelegate {

    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {

        guard let text = textField.text else { return false }

        textfield.text = viewModel?.maskedText(text, forReplacementString: string, in: range)
        viewModel?.text.accept(textfield.text)
        
        return false
    }
}

// MARK: - ViewStackable

extension ViewStackable {

    public func addStackableView(with viewModel: InputViewModel) {

        let view = InputView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}

// MARK: - ViewStackable - Currency

extension ViewStackable {

    public func addStackableView(with viewModel: CurrencyInputViewModel) {

        let view = InputView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}

// MARK: - ViewStackable - Percentage

extension ViewStackable {

    public func addStackableView(with viewModel: PercentageInputViewModel) {

        let view = InputView()
        view.configure(with: viewModel)
        stackView.addArrangedSubview(view)
    }
}
