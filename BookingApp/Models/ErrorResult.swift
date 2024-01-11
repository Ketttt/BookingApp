//
//  ErrorResult.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

struct ErrorResult<T: Decodable>: Decodable {
    let errorData: T?
    let errorMessage: String?
    let errorCode: String?
}

struct ErrorDataResult: Decodable {
    let ids: [String]?
}
