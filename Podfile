# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

use_frameworks!
inhibit_all_warnings!

workspace 'InvestmentCalculator'

# Define main test pods.
def common_test_pods
  pod 'Quick'
  pod 'Nimble'
end

abstract_target 'InvestmentCalculatorTargets' do

  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SwiftLint'
  pod 'SwiftGen'

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

  target 'NetworkPackage' do
    project 'NetworkPackage/NetworkPackage.xcodeproj'

    # Pods for NetworkPackage

  end
end



