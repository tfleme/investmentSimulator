# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

workspace 'InvestmentCalculator'

pod 'SwiftLint'

# Define main test pods.
def common_test_pods
  pod 'Quick'
  pod 'Nimble'
end

abstract_target 'InvestmentCalculatorTargets' do

  pod 'RxSwift'
  pod 'RxCocoa'

  target 'InvestmentCalculator' do
    project 'InvestmentCalculator/InvestmentCalculator.xcodeproj'

    # Pods for InvestmentCalculator

    target 'InvestmentCalculatorTests' do
      project 'InvestmentCalculator/InvestmentCalculator.xcodeproj'

      common_test_pods
      # Pods for InvestmentCalculatorTests
      pod 'KIF'
    end
  end

  target 'Components' do
    project 'Components/Components.xcodeproj'

    # Pods for Components

    target 'ComponentsTests' do
      project 'Components/Components.xcodeproj'

      common_test_pods
      # Pods for ComponentsTests
    end
  end
end



