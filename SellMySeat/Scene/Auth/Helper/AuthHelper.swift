//
//  AuthHelper.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 23.04.25.
//

import Foundation

final class AuthHelper {
    
    private var email: String?
    private var password: String?
    
    static let shared = AuthHelper()
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setPassword(_ password: String) {
        self.password = password
    }
}
