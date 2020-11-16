import KIF

@testable import InvestmentCalculator

final class SimulatorCoordinatorUITests: KIFTestCase {

    // MARK: - Private properties

    private let factory = DependencyContainerStub()

    private var window: UIWindow!
    private var tester: KIFUITestActor!
    private var navigationController: UINavigationController!
    private var coordinator: AppCoordinator!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        KIFEnableAccessibility()
        tester = KIFUITestActor(file: #file, line: #line, delegate: self)
    }

    override func beforeEach() {
        super.beforeEach()

        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window, factory: factory)
    }

    override func afterEach() {
        super.afterEach()

        window?.isHidden = true
        window = nil
    }
}

// MARK: - Public methods - Testing

extension SimulatorCoordinatorUITests {

    func testSimulatorInput() {

        factory.invesmentSimulationUseCases.simulateResult = .just(.mock())

        tester.waitForView(withAccessibilityLabel: "SimulatorInputView")
        tester.wait(forTimeInterval: 2.0)

        tester.tapView(withAccessibilityLabel: "InvestmentAmountView")
        tester.enterText(intoCurrentFirstResponder: "1534523")
        tester.tapView(withAccessibilityLabel: "SimpleToolbarView.doneButton")

        tester.tapView(withAccessibilityLabel: "InvestmentExpirationDateView")
        tester.enterText(intoCurrentFirstResponder: "14122025")
        tester.tapView(withAccessibilityLabel: "SimpleToolbarView.doneButton")

        tester.tapView(withAccessibilityLabel: "InvestmentPerformanceView")
        tester.enterText(intoCurrentFirstResponder: "123")
        tester.tapView(withAccessibilityLabel: "SimpleToolbarView.doneButton")

        tester.tapView(withAccessibilityLabel: "SimulatorInputView.actionButton")

        tester.waitForView(withAccessibilityLabel: "InvestmentSimulationDetailView")
        tester.wait(forTimeInterval: 2.0)
        tester.tapView(withAccessibilityLabel: "InvestmentSimulationDetailView.actionButton")
        tester.waitForView(withAccessibilityLabel: "SimulatorInputView")
    }
}
