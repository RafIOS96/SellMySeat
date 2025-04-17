// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
public enum Texts {

  public enum Test {

    public enum Word {
      /// en_test
      public static var skill: String { Texts.tr("Localizable", "test.word.skill") }
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension Texts {
static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    if let value = cache[key], args.isEmpty {
        return value
    }
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    let value = String(format: format, locale: Locale.current, arguments: args)
    if args.isEmpty {
        cache[key] = value
    }
    return value
  }

  public static func clearCache() {
     cache.removeAll()
  }
}

private final class BundleToken {}

fileprivate var cache = [String: String]()

