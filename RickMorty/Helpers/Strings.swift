// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Personagens
  internal static let characters = L10n.tr("LocalizableStrings", "characters", fallback: "Personagens")
  /// Não conseguimos carregar os personagens
  internal static let errorDescription = L10n.tr("LocalizableStrings", "errorDescription", fallback: "Não conseguimos carregar os personagens")
  /// exemplo
  internal static let exemploString = L10n.tr("LocalizableStrings", "exemploString", fallback: "exemplo")
  /// exemploTexto
  internal static let exemploTexto = L10n.tr("LocalizableStrings", "exemploTexto", fallback: "exemploTexto")
  /// Tentar novamente
  internal static let tryAgain = L10n.tr("LocalizableStrings", "tryAgain", fallback: "Tentar novamente")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
