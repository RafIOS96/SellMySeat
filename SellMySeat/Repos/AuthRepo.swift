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
    func doSignUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: "helix@gmail.com", password: password) { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            if error != nil {
                if let error = error as NSError? {
                    let message = error.localizedDescription
                    print(message)
                }
            } else {
                print(result?.additionalUserInfo)
            }
        }
    }
    
    func doSignIn(email: String,
                  password: String,
                  completionHandler: @escaping (NetworkError?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                if let error = error as NSError? {
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    completionHandler(networkError)
                }
            } else {
                completionHandler(nil)
            }
        }
    }
}
