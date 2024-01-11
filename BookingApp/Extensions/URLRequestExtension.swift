//
//  URLRequestExtension.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 11.01.2024.
//

import Foundation

extension URLRequest {

    public func outLogger() -> Self {

        let urlString = self.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)

        let method = self.httpMethod ?? ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"

        var requestLog = "\n---------- OUT ---------->\n"
        requestLog += "\(method)\n"
        requestLog += "\(urlString)\n"
        requestLog += "\(path)\n"
        requestLog += "\(query)"
        requestLog += "Host: \(host)\n"
        for (key, value) in self.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        
        if let body = self.httpBody {
            var jsonData: Data?
            if let object = try? JSONSerialization.jsonObject(with: body, options: []){
                jsonData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
            }
            let bodyString = NSString(data: jsonData ?? body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded"
            requestLog += "\n\(bodyString)\n"
        }

        requestLog += "\n------------------------->\n"

        print(requestLog)
        return self
    }
    
     func inLogger(data: Data?, response: HTTPURLResponse?, error: Error? = nil) {

        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")

        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"

        var responseLog = "\n<---------- IN ----------\n"

        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
        }

        if let statusCode =  response?.statusCode {
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
        }

        if let host = components?.host {
            responseLog += "Host: \(host)\n"
        }

        for (key, value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
        }

        if let body = data {
            var jsonData: Data?
            if let object = try? JSONSerialization.jsonObject(with: body, options: []){
                jsonData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
            }
            let bodyString = NSString(data: jsonData ?? body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded"
            responseLog += "\n\(bodyString)\n"
        }

        if let error = error {
            responseLog += "\nError: \(error.localizedDescription)\n"
        }
        responseLog += "<------------------------\n"
        print(responseLog)
    }
}

