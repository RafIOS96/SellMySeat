// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum Auth: StoryboardType {
    internal static let storyboardName = "Auth"

    internal static let authVC = SceneType<Tixify.AuthVC>(storyboard: Self.self, identifier: "AuthVC")
  }
  internal enum Forgot: StoryboardType {
    internal static let storyboardName = "Forgot"

    internal static let forgotVC = SceneType<Tixify.ForgotVC>(storyboard: Self.self, identifier: "ForgotVC")
  }
  internal enum Home: StoryboardType {
    internal static let storyboardName = "Home"

    internal static let initialScene = InitialSceneType<Tixify.HomeVC>(storyboard: Self.self)

    internal static let homeVC = SceneType<Tixify.HomeVC>(storyboard: Self.self, identifier: "HomeVC")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: Self.self)
  }
  internal enum Onboarding: StoryboardType {
    internal static let storyboardName = "Onboarding"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Self.self)

    internal static let onboardingVC = SceneType<Tixify.OnboardingVC>(storyboard: Self.self, identifier: "OnboardingVC")

    internal static let baseNav = SceneType<UIKit.UINavigationController>(storyboard: Self.self, identifier: "baseNav")
  }
  internal enum Profile: StoryboardType {
    internal static let storyboardName = "Profile"

    internal static let initialScene = InitialSceneType<Tixify.ProfileVC>(storyboard: Self.self)

    internal static let profileVC = SceneType<Tixify.ProfileVC>(storyboard: Self.self, identifier: "ProfileVC")
  }
  internal enum SignUp: StoryboardType {
    internal static let storyboardName = "SignUp"

    internal static let signUpVC = SceneType<Tixify.SignUpVC>(storyboard: Self.self, identifier: "SignUpVC")
  }
  internal enum TabBar: StoryboardType {
    internal static let storyboardName = "TabBar"

    internal static let initialScene = InitialSceneType<Tixify.TabBarVC>(storyboard: Self.self)

    internal static let tabBarVC = SceneType<Tixify.TabBarVC>(storyboard: Self.self, identifier: "TabBarVC")
  }
  internal enum Ticket: StoryboardType {
    internal static let storyboardName = "Ticket"

    internal static let initialScene = InitialSceneType<Tixify.TicketVC>(storyboard: Self.self)

    internal static let ticketVC = SceneType<Tixify.TicketVC>(storyboard: Self.self, identifier: "TicketVC")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
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
