//
//  ReservDetails.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

@ViewBuilder
func reservDetails(model: BookingViewModel) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        BookingInfoStackView(title: Constants.BuyerInformation.departure, subtitle: model.bookingData?.departure ?? "")
            .padding(.top, 16)
        BookingInfoStackView(title: Constants.BuyerInformation.country, subtitle: model.bookingData?.arrivalCountry ?? "")
        let date = "\(model.bookingData?.tourDateStart ?? "") - \(model.bookingData?.tourDateStop ?? "")"
        BookingInfoStackView(title: Constants.BuyerInformation.dates, subtitle: date)
        BookingInfoStackView(title: Constants.BuyerInformation.numOfNight, subtitle: "\(model.bookingData?.numberOfNights ?? 0) ночь")
        BookingInfoStackView(title: Constants.BuyerInformation.numOfNight, subtitle: "\(model.bookingData?.numberOfNights ?? 0) ночь")
        BookingInfoStackView(title: Constants.BuyerInformation.room, subtitle: model.bookingData?.room ?? "")
        BookingInfoStackView(title: Constants.BuyerInformation.nutrition, subtitle: model.bookingData?.nutrition ?? "")
            .padding(.bottom, 16)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .cornerRadius(12)
}
