//
//  OnboardingVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 10.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class OnboardingVM: BaseVM {
    
    private var profileRepo = ProfileRepo()
    private var authRepo = AuthRepo()
    
    func getProfile() {
        self.profileRepo.getProfile()
    }
    
    func updateInfo() {
        self.profileRepo.updateUserInfo()
    }
    
    func signUp() {
        self.authRepo.doSignUp(email: "secontest@gmail.com", password: "1234567")
    }
    //    func createTicket() {
    //        if Auth.auth().currentUser != nil && Auth.auth().currentUser?.uid != nil {
    //            let uId: String = Auth.auth().currentUser!.uid
    //
    //            let db = Firestore.firestore()
    //
    //            let ticketData: [String: Any] = [
    //                "category": "concert",
    //                "city": "yerevan",
    //                "country": "armenia",
    //                "expTime" : "20.05.2025",
    //                "name" : "Jenifer Lopes",
    //                "price" : 200,
    //                "seatLine" : 4,
    //                "seatNumber" : 7,
    //                "status": 0
    //            ]
    //
    //            let ticketId = "ticket_\(UUID().uuidString)"
    //            db.collection("users").document(uId).collection("tickets").document(ticketId).setData(ticketData) { [weak self] error in
    //                guard let strongSelf = self else {
    //                    return
    //                }
    //                if let error = error {
    //                    print("Error saving ticket: \(error)")
    //                } else {
    //                    print("Ticket with ID \(ticketId) saved.")
    //                }
    //            }
    //        } else {
    //            LOG_WARNING
    //        }
    //    }
}
