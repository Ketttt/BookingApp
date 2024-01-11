//
//  HTTPMethod.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

enum HTTPMethod {
    case post
    case get
    case put
    case patch
    case delete
    
    var method: String {
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        case .put: return "PUT"
        case .patch: return "PATCH"
        case .delete: return "DELETE"
        }
    }
}
