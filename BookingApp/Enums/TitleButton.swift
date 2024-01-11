//
//  TitleButton.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

enum TitleButton: CaseIterable {
    case conveniences
    case included
    case notIncluded
    
    var id: Int {
        switch self {
        case .conveniences:
            return 0
        case .included:
            return 2
        case .notIncluded:
            return 3
        }
    }
    
    var title: String {
        switch self {
        case .conveniences:
            return Constants.Hotel.conveniences
        case .included:
            return Constants.Hotel.included
        case .notIncluded:
            return Constants.Hotel.notIncluded
        }
    }
    
    var image: String {
        switch self {
        case .conveniences:
            return "conveniences"
        case .included:
            return "included"
        case .notIncluded:
            return "notIncluded"
        }
    }
}
