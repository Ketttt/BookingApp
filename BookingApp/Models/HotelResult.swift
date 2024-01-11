//
//  HotelResult.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

// MARK: - HotelResult
struct HotelResult: Decodable {
    let id: Int
    let name, adress, priceForIt, ratingName: String
    let minimalPrice, rating: Int
    var imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}
