//
//  HotelDetails.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct HotelDetails: View, Chips {
    
    @EnvironmentObject var model: HotelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(Constants.Hotel.hotelInfo)
                .font(.system(size: 30))
                .padding(.bottom, 8)
            
            if let peculiarities = model.hotelData?.aboutTheHotel.peculiarities {
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(getRows(peculiarities: peculiarities), id: \.self) { rows in
                        HStack {
                            ForEach(rows, id: \.self) { row in
                                ChipsView(peculiarities: row)
                            }
                        }
                    }
                }
            }//if
            
            Text(model.hotelData?.aboutTheHotel.description ?? "")
                .padding(.vertical, 4)
            
            HotelListView()
            
        }//VStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
    }
}
