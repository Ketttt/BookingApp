//
//  BookingView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct BookingView: View {
    
    @StateObject var model: BookingViewModel = BookingViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if !model.loading {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        HotelHeaderView(rating: model.bookingData?.horating ?? 0, ratingName: model.bookingData?.ratingName ?? "", name: model.bookingData?.hotelName ?? "", adress: model.bookingData?.hotelAdress ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.all, 16)
                            .background(.white)
                            .cornerRadius(12)
                        
                        reservDetails(model: model)
                        
                        BuyerInformationView()
                            .environmentObject(model)
                        
                        TouristFormView()
                            .environmentObject(model)
                        
                        AddTouristView()
                            .environmentObject(model)
                        
                        
                        VStack(alignment: .leading, spacing: 16) {
                            TouristInfoView(title: Constants.BuyerInformation.tour, subtitle: "\(model.bookingData?.tourPrice ?? 0) ₽")
                                .padding(.top, 16)
                            TouristInfoView(title: Constants.BuyerInformation.fuelSurcharge, subtitle: "\(model.bookingData?.fuelCharge ?? 0) ₽")
                            TouristInfoView(title: Constants.BuyerInformation.serviceFee, subtitle: "\(model.bookingData?.serviceCharge ?? 0) ₽")
                            TouristInfoView(title: Constants.BuyerInformation.toPay, subtitle: "\(model.bookingData?.finalСost ?? "") ₽")
                                .padding(.bottom, 16)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(12)
                        
                        VStack {
                            NavigationLink(destination: FihishView()) {
                                ButtonView(title: "Оплатить \(model.bookingData?.finalСost ?? "") ₽")
                                
                            }
                            .disabled(!model.isActiveFinishView)
                            .onTapGesture {
                                model.checkValid = true
                            }
                            .navSets(navTitle: Constants.NavTitle.booking)
                            .padding(.horizontal, 12)
                        }
                        .padding(.vertical, 12)
                        .background(Color.white)
                        
                    }//VStack
                    
                }//ScrollView
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(CustomColor.bg)
            }
            
            if model.loading {
                LoaderView()
            }
        }//ZStack
    }
}

extension BookingView {
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
}
