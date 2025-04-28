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
                    Helper.regLogs(isSuccess: false, message: "db.collection(tickets).document(ticketId).setData(ticketData)")
                    Helper.regLogs(isSuccess: false, message: "Error saving ticket: \(networkError.getDisplayDescription)")
                } else {
                    Helper.regLogs(isSuccess: true, message: "Ticket with ID saved successfully")
                }
            }
        }
    }
    
    func deleteTicket(id: String) {
        if Auth.auth().currentUser != nil {
            let db = Firestore.firestore()
            db.collection("tickets").document(id).delete { error in
                if let error = error {
                    let networkError = NetworkError(firebaseError: error, code: (error as NSError).code)
                    Helper.regLogs(isSuccess: false, message: "db.collection(tickets).document(id).delete")
                    Helper.regLogs(isSuccess: false, message: "Error deleting ticket: \(networkError.getDisplayDescription)")
                } else {
                    Helper.regLogs(isSuccess: true, message: "Ticket successfully deleted")
                }
            }
        }
    }
    
    func getTicketData(id: String) {
        if Auth.auth().currentUser != nil {
            let db = Firestore.firestore()
            db.collection("tickets").document(id).getDocument { snapshot, error in
                if let error = error {
                    print("Error fetching ticket: \(error)")
                    return
                }

                do {
                    if let ticket = try snapshot?.data(as: Ticket.self) {
                        Helper.regLogs(isSuccess: true, message: "db.collection(tickets).document(id).getDocument")
                        Helper.regLogs(isSuccess: true, message: "Parsed Ticket: \(ticket)")
                    } else {
                        Helper.regLogs(isSuccess: false, message: "No ticket data found.")
                    }
                } catch {
                    Helper.regLogs(isSuccess: false, message: "Error parsing ticket: \(error.localizedDescription)")
                }
            }
        }
    }
}
