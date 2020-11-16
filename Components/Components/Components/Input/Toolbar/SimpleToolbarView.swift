import UIKit
import RxSwift
import RxCocoa

final class SimpleToolbarView: UIToolbar {

    // MARK: - Private properties

    var cancelButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem!

    private let doneButtonTitle: String
    private let cancelButtonTitle: String

    // MARK: - Public properties

    let doneButtonTap = PublishRelay<Void>()
    let cancelButtonTap = PublishRelay<Void>()

    // MARK: - Initializers

    init(doneButtonTitle: String = "", cancelButtonTitle: String = "") {

        self.doneButtonTitle = doneButtonTitle
        self.cancelButtonTitle = cancelButtonTitle

        super.init(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))

        setupUI()
        setupAccessibilityLabels()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods - Setup

extension SimpleToolbarView {

    private func setupUI() {

        cancelButton = UIBarButtonItem(
            title: cancelButtonTitle,
            style: .plain,
            target: self,
            action: #selector(cancelButtonTapped))
        cancelButton.tintColor = .darkGray

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        doneButton = UIBarButtonItem(
            title: doneButtonTitle,
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped))
        doneButton.tintColor = .darkGray

        setItems([cancelButton, flexibleSpace, doneButton], animated: false)

        sizeToFit()
    }
}

// MARK: - Private methods - Actions

extension SimpleToolbarView {

    @objc
    private func cancelButtonTapped() {
        cancelButtonTap.accept(())
    }

    @objc
    private func doneButtonTapped() {
        doneButtonTap.accept(())
    }
}

// MARK: - Private methods - Accessibility

extension SimpleToolbarView {
    
    private func setupAccessibilityLabels() {
        
        cancelButton.accessibilityLabel = "SimpleToolbarView.cancelButton"
        cancelButton.isAccessibilityElement = true
        doneButton.accessibilityLabel = "SimpleToolbarView.doneButton"
        doneButton.isAccessibilityElement = true
    }
}
