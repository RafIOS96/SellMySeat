//
//  ProfileRepo.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileRepo {
    
    func getProfile() {
        if Auth.auth().currentUser != nil {
            let uId = Auth.auth().currentUser!.uid
            let db = Firestore.firestore()
            db.collection("users").document(uId).getDocument { (document, error) in
                if let error = error {
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    Helper.regLogs(isSuccess: false, message: "Firebase error: \(networkError.getDisplayDescription)")
                    return
                }
                
                if let document = document, document.exists {
                    do {
                        let user = try document.data(as: User.self)
                        Helper.regLogs(isSuccess: true, message: "Get profile is succeeded")
                        Helper.regLogs(isSuccess: true, message: "User: \(user)")
                    } catch {
                        let decodingError = NetworkError(firebaseError: error, code: (error as NSError).code)
                        Helper.regLogs(isSuccess: false, message: "db.collection(users).document(uId).getDocument")
                        Helper.regLogs(isSuccess: false, message: "Decoding error: \(decodingError.getDisplayDescription)")
                    }
                } else {
                    Helper.regLogs(isSuccess: false, message: "⚠️ Document does not exist")
                }
            }
        }
    }
    
    func updateUserInfo() {
        if Auth.auth().currentUser != nil && Auth.auth().currentUser?.uid != nil {
            let currentUser = Auth.auth().currentUser!
            let uId: String = currentUser.uid
            let email: String = currentUser.email ?? ""
            let db = Firestore.firestore()

            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            formatter.locale = Locale.current
            let dateString = formatter.string(from: Date())

            db.collection("users").document("\(uId)").setData([
                "email": email,
                "name": "Edgar",
                "lastLogin": dateString,
                "surname": "Mansuryan",
                "imgSrc": "",
                "type": "user"], completion: { (error) in
                    if let err = error {
                        let networkError = NetworkError(firebaseError: err, code: (err as NSError).code)
                        Helper.regLogs(isSuccess: false, message: "db.collection(users).document(uId).setData")
                        Helper.regLogs(isSuccess: false, message: "\(networkError.getDisplayDescription)")
                    } else {
                        Helper.regLogs(isSuccess: true, message: "update user info successfull")
                    }
            })
        }
    }
    
    func doSignOut() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                Helper.regLogs(isSuccess: true, message: "User signed out successfully")
            } catch let error as NSError {
                let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                Helper.regLogs(isSuccess: false, message: "sign out")
                Helper.regLogs(isSuccess: false, message: "\(networkError.getDisplayDescription)")
            }
        }
    }
}
