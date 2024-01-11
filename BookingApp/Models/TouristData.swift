//
//  TouristData.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

struct TouristData: Identifiable, Hashable {
    let id = UUID().uuidString
    var firstName: String = ""
    var lastName: String = ""
    var birthday: String = ""
    var passportNumber: String = ""
    var expiryDate: String = ""
    var citizenship: String = ""
    
    init() {}
    
    //local
    var isShowingContent: Bool = false
    var isRotatingForm = 0.0
    
    func isTouristFullData() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !birthday.isEmpty &&
        !passportNumber.isEmpty && !expiryDate.isEmpty && !citizenship.isEmpty
    }
}
