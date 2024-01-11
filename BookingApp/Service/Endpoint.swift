//
//  Endpoint.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

//MARK: - Cases
enum Endpoint {
    case hotelDetail(id: String)
    case roomDetail(id: String)
    case bookingDetail(id: String)

    //MARK: - Request
    var request: URLRequest {
        return ApiRequest(endpoint: self).request
    }
    
}
