//
//  AuthRepo.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthRepo {
    func doSignUp(email: String,
                  password: String,
                  completionHandler: @escaping (NetworkError?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if error != nil {
                if let error = error as NSError? {
                    Helper.regLogs(isSuccess: false, message: "Auth.auth().createUser")
                    Helper.regLogs(isSuccess: false, message: error.localizedDescription)
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    completionHandler(networkError)
                }
            } else {
                Helper.regLogs(isSuccess: true, message: "user created successfully")
                completionHandler(nil)
            }
        }
    }
    
    func doSignIn(email: String,
                  password: String,
                  completionHandler: @escaping (NetworkError?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                if let error = error as NSError? {
                    Helper.regLogs(isSuccess: false, message: "Auth.auth().signIn")
                    Helper.regLogs(isSuccess: false, message: error.localizedDescription)
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    completionHandler(networkError)
                }
            } else {
                Helper.regLogs(isSuccess: true, message: "user sign in successfully")
                completionHandler(nil)
            }
        }
    }
}
