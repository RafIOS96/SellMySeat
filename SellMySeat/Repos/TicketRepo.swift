//
//  TicketRepo.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TicketRepo {
    
    func createTicket() {
        if Auth.auth().currentUser != nil {
            let uId: String = Auth.auth().currentUser!.uid
            let db = Firestore.firestore()
            let ticketId = "\(UUID().uuidString)"
            let ticketData: [String: Any] = [
                "category": "concert",
                "city": "yerevan",
                "country": "armenia",
                "expTime" : "20.05.2025",
                "name" : "Jenifer Lopes",
                "price" : 200,
                "seatLine" : 4,
                "seatNumber" : 7,
                "sellerId": uId,
                "ticketId": ticketId,
                "isSold": false
            ]
            db.collection("tickets").document(ticketId).setData(ticketData) { [weak self] error in
                guard let strongSelf = self else {
                    return
                }
                if let error = error {
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    print("🔥 Error saving ticket: \(networkError.getDisplayDescription)")
                } else {
                    print("✅ Ticket with ID saved.")
                }
            }
        }
    }
    
    func deleteTicket() {
        if Auth.auth().currentUser != nil {
            let db = Firestore.firestore()
            db.collection("tickets").document("5F6D0539-207F-48C7-A428-61DCBA70953D").delete { error in
                if let error = error {
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    print("🔥 Error deleting ticket: \(networkError.getDisplayDescription)")
                } else {
                    print("✅ Ticket successfully deleted")
                }
            }
        }
    }
    
    func getTicketData() {
        if Auth.auth().currentUser != nil {
            let db = Firestore.firestore()
            db.collection("tickets").document("5F6D0539-207F-48C7-A428-61DCBA70953D").getDocument { snapshot, error in
                if let error = error {
                    print("Error fetching ticket: \(error)")
                    return
                }

                do {
                    if let ticket = try snapshot?.data(as: Ticket.self) {
                        print("Parsed Ticket: \(ticket)")
                    } else {
                        print("No ticket data found.")
                    }
                } catch {
                    print("Error parsing ticket: \(error)")
                }
            }
        }
    }
}
