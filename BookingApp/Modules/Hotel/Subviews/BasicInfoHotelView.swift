//
//  BasicInfoHotelView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct BasicInfoHotelView: View {
    
    @EnvironmentObject var model: HotelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            if let images = model.hotelData?.imageUrls {
                ImageTabView(items: images)
            }
            //Основные данные про отель
            VStack(alignment: .leading, spacing: 16) {
                
                HotelHeaderView(rating: model.hotelData?.rating ?? 0, ratingName: model.hotelData?.ratingName ?? "", name: model.hotelData?.name ?? "", adress: model.hotelData?.adress ?? "")
                
                HStack(alignment: .bottom, spacing: 8) {
                    Text("от \(model.hotelData?.minimalPrice ?? 123466) ₽")
                        .font(.system(size: 30))
                    
                    Text(model.hotelData?.priceForIt ?? "")
                        .foregroundColor(CustomColor.grayText)
                        .font(.system(size: 16))
                }
            }//VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }//VStack
        .frame(maxWidth: .infinity)
        .padding(.all, 16)
        .background(Color.white)
        .cornerRadius(12, corners: [.bottomLeft,.bottomRight])
    }
}
