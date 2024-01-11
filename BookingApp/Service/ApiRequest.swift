//
//  ApiRequest.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 11.01.2024.
//

import Foundation

final class ApiRequest {
    
    //MARK: - Properties
    let endpoint: Endpoint
    var baseURL: URL { URL(string: "https://run.mocky.io/v3/")! }
    
    //MARK: - Init
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    var request: URLRequest {
        let apiPath = ApiPath(endpoint)
        
        let url = baseURL.appendingPathComponent(apiPath.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        var request = URLRequest(url: url)
        
        let params = ["Content-Type": "application/json"]
        params.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }

        request.httpMethod = apiPath.httpMethod.method
        return request //.outlogger
    }
}


final class ApiPath {
    
    //MARK: - Constants
    let endpoint: Endpoint
    
    //MARK: - Init
    init(_ endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    //MARK: - Properties
    var path: String {
        switch endpoint {
            
            //Новости
        case .hotelDetail(let id), .roomDetail(let id), .bookingDetail(let id):
            return id
        }
    }
    
    //MARK: - HTTPMethod
    var httpMethod: HTTPMethod {
        switch endpoint {
        default: return .get
        }
    }
}

