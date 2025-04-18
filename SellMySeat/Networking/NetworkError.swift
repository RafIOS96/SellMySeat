//
//  NetworkError.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import Foundation
import FirebaseAuth

public struct ErrorDetails: Codable {
    public var code: Int?
    public var message: String?
}

public typealias ErrorKey = String

public struct NetworkError: Error, Decodable {
    public var error: ErrorDetails?
    public var errors: [ErrorKey: String]?

    public init(error: ErrorDetails? = nil,
                errors: [ErrorKey: String]? = nil) {
        self.error = error
        self.errors = errors
    }

    enum CodingKeys: String, CodingKey {
        case error
        case errors
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try? values.decodeIfPresent(ErrorDetails.self, forKey: .error)
        self.errors = try? values.decodeIfPresent([ErrorKey: String].self, forKey: .errors)
    }

    public init(firebaseError: Error, code: Int) {
        self.error = ErrorDetails()
        self.error?.code = code

        let nsError = firebaseError as NSError
        if nsError.domain == AuthErrorDomain,
           let firebaseCode = AuthErrorCode(rawValue: nsError.code) {
            self.error?.message = {
                switch firebaseCode {
                case .networkError:
                    return "No Internet Connection"
                case .userNotFound:
                    return "User not found"
                case .wrongPassword:
                    return "Incorrect password"
                case .invalidEmail:
                    return "Invalid email address"
                case .emailAlreadyInUse:
                    return "Email already in use"
                case .weakPassword:
                    return "Weak password"
                case .userDisabled:
                    return "User account is disabled"
                case .tooManyRequests:
                    return "Too many requests. Try again later."
                case .internalError:
                    return "Internal error occurred"
                case .missingEmail:
                    return "Missing email address"
                case .invalidCustomToken:
                    return "Invalid custom token"
                case .userTokenExpired:
                    return "User token expired"
                case .invalidUserToken:
                    return "Invalid user token"
                default:
                    return nsError.localizedDescription
                }
            }()
        } else {
            self.error?.message = nsError.localizedDescription
        }
    }

    public var getDisplayDescription: String {
        let isProdEnv = Constants.env == .Prod

        var codeStr = ""
        if let safeCode = error?.code, !isProdEnv {
            codeStr = "Status code: \(safeCode) "
        }

        var statusStr = ""
        if let safeStatus = error?.message, !isProdEnv {
            statusStr = "Status: \(safeStatus)"
        }

        var messageStr = ""
        if let safeMessage = error?.message {
            messageStr = (isProdEnv ? "" : "\nMessage: ") + safeMessage
        }

        var errorFieldsStr = ""
        if let safeErrors = errors {
            let safeErrorsStr = safeErrors.map {
                (isProdEnv ? "" : ($0.0 + ": ")) + $0.1
            }.joined(separator: ", ")
            errorFieldsStr = (isProdEnv ? "" : "\nErrors: ") + safeErrorsStr
        }

        if isProdEnv {
            return messageStr
        } else {
            return codeStr + statusStr + messageStr + errorFieldsStr
        }
    }

    public func isUnathorized() -> Bool {
        return error?.code == 401 && error?.message?.uppercased() == "UNAUTHORIZED"
    }
}

extension NetworkError {
    public func toNSError() -> NSError {
        return NSError(
            domain: Bundle.main.bundleIdentifier ?? "Application",
            code: error?.code ?? 0,
            userInfo: [NSLocalizedDescriptionKey: error?.message ?? "Unknown error"]
        )
    }
}
