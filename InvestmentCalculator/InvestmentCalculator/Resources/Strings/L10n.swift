// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Default {
    /// ##/##/####
    internal static let dayMonthYearMask = L10n.tr("Localizable", "default.dayMonthYearMask")
  }

  internal enum SimulatorDetail {
    /// Rentabilidade anual
    internal static let annualGrossProfit = L10n.tr("Localizable", "simulatorDetail.annualGrossProfit")
    /// Simular novamente
    internal static let buttonTitle = L10n.tr("Localizable", "simulatorDetail.buttonTitle")
    /// Rendimento total de %@
    internal static func currency(_ p1: Any) -> String {
      return L10n.tr("Localizable", "simulatorDetail.currency", String(describing: p1))
    }
    /// Valor bruto do investimento
    internal static let grossAmount = L10n.tr("Localizable", "simulatorDetail.grossAmount")
    /// Valor do rendimento
    internal static let grossProfit = L10n.tr("Localizable", "simulatorDetail.grossProfit")
    /// Valor aplicado inicialmente
    internal static let investedAmount = L10n.tr("Localizable", "simulatorDetail.investedAmount")
    /// Data de resgate
    internal static let maturityDate = L10n.tr("Localizable", "simulatorDetail.maturityDate")
    /// Dias corridos
    internal static let maturityTotalDays = L10n.tr("Localizable", "simulatorDetail.maturityTotalDays")
    /// Rendimento mensal
    internal static let monthlyGrossProfit = L10n.tr("Localizable", "simulatorDetail.monthlyGrossProfit")
    /// Valor líquido do investimento
    internal static let netAmount = L10n.tr("Localizable", "simulatorDetail.netAmount")
    /// Percentual do CDI do investimento
    internal static let rate = L10n.tr("Localizable", "simulatorDetail.rate")
    /// Rentabilidade no período
    internal static let rateProfit = L10n.tr("Localizable", "simulatorDetail.rateProfit")
    /// IR sobre o investimento
    internal static let taxesRate = L10n.tr("Localizable", "simulatorDetail.taxesRate")
    /// Resultado da simulação
    internal static let title = L10n.tr("Localizable", "simulatorDetail.title")
    internal enum NavigationItem {
      /// Investimento
      internal static let title = L10n.tr("Localizable", "simulatorDetail.navigationItem.title")
    }
  }

  internal enum SimulatorInput {
    /// Simular
    internal static let buttonTitle = L10n.tr("Localizable", "simulatorInput.buttonTitle")
    internal enum Amount {
      /// R$
      internal static let placeholder = L10n.tr("Localizable", "simulatorInput.amount.placeholder")
      /// Quanto você gostaria de aplicar? *
      internal static let title = L10n.tr("Localizable", "simulatorInput.amount.title")
    }
    internal enum ExpirationDate {
      /// Data inválida.
      internal static let error = L10n.tr("Localizable", "simulatorInput.expirationDate.error")
      /// dia/mês/ano
      internal static let placeholder = L10n.tr("Localizable", "simulatorInput.expirationDate.placeholder")
      /// Qual a data de vencimento do investimento? *
      internal static let title = L10n.tr("Localizable", "simulatorInput.expirationDate.title")
    }
    internal enum NavigationItem {
      /// Simulador
      internal static let title = L10n.tr("Localizable", "simulatorInput.navigationItem.title")
    }
    internal enum Performance {
      /// 100%%
      internal static let placeholder = L10n.tr("Localizable", "simulatorInput.performance.placeholder")
      /// Qual o percentual do CDI do investimento? *
      internal static let title = L10n.tr("Localizable", "simulatorInput.performance.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
