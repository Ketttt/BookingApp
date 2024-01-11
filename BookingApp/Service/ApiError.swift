//
//  ApiError.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

enum  ApiError : Error {
 case requestFailed(description: String )
 case invalidData
 case responseUnsuccessful(description: String )
 case jsonConversionFailure(description: String )
 case jsonParsingFailure
 case errorSerialization
 case noInternet

 var customDescription: String {
  switch  self {
  case  .requestFailed(let description): return  "Ошибка запроса: \(description)"
  case  .invalidData: return  "Invalid Data"
  case  .responseUnsuccessful(let description): return  "Unsuccessful: \(description)"
  case  .jsonConversionFailure(let description): return  "Ошибка преобразования JSON» : \(description)"
  case  .jsonParsingFailure: return  "Ошибка синтаксического анализа JSON"
  case  .errorSerialization: return  "Ошибка сериализации"
  case  .noInternet: return  "Нет подключения к Интернету"
   }
}
}
