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
    
    func doSignIn() {
        Auth.auth().signIn(withEmail: "test@test.com", password: "123456") { [weak self] result, error in
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
}
