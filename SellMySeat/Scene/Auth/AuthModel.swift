//
//  AuthModel.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

struct User: Codable {
    let name: String?
    let surname: String?
    let birthday: String?
    let imgSrc: String?
    let lastLogin: String?
    let type: String?
}

struct Ticket: Codable {
    let category: String?
    let city: String?
    let country: String?
    let expTime: String?
    let name: String?
    let price: Int?
    let seatLine: Int?
    let seatNumber: Int?
    let status: Int?
}
