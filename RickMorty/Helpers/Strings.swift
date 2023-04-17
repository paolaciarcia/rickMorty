// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Alive
  internal static let alive = L10n.tr("LocalizableStrings", "alive", fallback: "Alive")
  /// Character detail
  internal static let characterDetail = L10n.tr("LocalizableStrings", "characterDetail", fallback: "Character detail")
  /// Characters
  internal static let characters = L10n.tr("LocalizableStrings", "characters", fallback: "Characters")
  /// Dead
  internal static let dead = L10n.tr("LocalizableStrings", "dead", fallback: "Dead")
  /// %@ - %@
  internal static func detailConnection(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("LocalizableStrings", "detailConnection", String(describing: p1), String(describing: p2), fallback: "%@ - %@")
  }
  /// Oops! We couldn't find the requested character
  internal static let emptyStateDescription = L10n.tr("LocalizableStrings", "emptyStateDescription", fallback: "Oops! We couldn't find the requested character")
  /// Something went wrong and we couldn't load the characters
  internal static let errorDescription = L10n.tr("LocalizableStrings", "errorDescription", fallback: "Something went wrong and we couldn't load the characters")
  /// Filter
  internal static let filter = L10n.tr("LocalizableStrings", "filter", fallback: "Filter")
  /// Filters
  internal static let filters = L10n.tr("LocalizableStrings", "filters", fallback: "Filters")
  /// Name
  internal static let name = L10n.tr("LocalizableStrings", "name", fallback: "Name")
  /// New search
  internal static let newSearch = L10n.tr("LocalizableStrings", "newSearch", fallback: "New search")
  /// Status
  internal static let status = L10n.tr("LocalizableStrings", "status", fallback: "Status")
  /// Character name
  internal static let textFieldDefaultName = L10n.tr("LocalizableStrings", "textFieldDefaultName", fallback: "Character name")
  /// Try again
  internal static let tryAgain = L10n.tr("LocalizableStrings", "tryAgain", fallback: "Try again")
  /// Unknown
  internal static let unknown = L10n.tr("LocalizableStrings", "unknown", fallback: "Unknown")
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
