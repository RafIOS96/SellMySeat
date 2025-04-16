//
//  Constants.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

struct Constants {
    enum Environment {
        case Dev
        case Prod
    }
    
    static var env: Environment {
        #if DEV
        return .Dev
        #elseif PROD
        return .Prod
        #else
        return .Prod
        #endif
    }

    static var apiBaseUrl: String {
        switch env {
        case .Dev:
            return "https://1bb2-141-136-88-119.ngrok.io"
        default:
            return "https://myust.app/api/"
        }
    }
        
    static var responseDefaultKeyPath: String = "data"
}

