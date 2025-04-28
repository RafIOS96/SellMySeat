//
//  ForgotRepo.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 28.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ForgotRepo {
    
    func forgotPassword(email: String, completion: @escaping (NetworkError?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                Helper.regLogs(isSuccess: false, message: "Auth.auth().sendPasswordReset")
                Helper.regLogs(isSuccess: false, message: error.localizedDescription)
                let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                completion(networkError)
            } else {
                Helper.regLogs(isSuccess: true, message: "user reset pass successfully")
                completion(nil)
            }
        }
    }
}
