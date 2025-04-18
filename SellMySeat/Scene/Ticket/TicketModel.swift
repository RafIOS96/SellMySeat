//
//  TicketModel.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

struct Ticket: Codable {
    let category: String?
    let city: String?
    let country: String?
    let expTime: String?
    let name: String?
    let price: Int?
    let seatLine: Int?
    let seatNumber: Int?
    let sellerId: String?
    let ticketId: String?
    let isSold: Bool?
}
