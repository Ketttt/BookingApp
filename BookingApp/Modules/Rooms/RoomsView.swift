//
//  RoomsView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct RoomsView: View, Chips {
    
    @StateObject var model: RoomsViewModel = RoomsViewModel()
    let hotelData: HotelResult?
    
    init(hotelData: HotelResult?) {
        self.hotelData = hotelData
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(model.roomsData.rooms) { room in
                    VStack(alignment: .leading) {
                        ImageTabView(items: room.imageUrls)
                        
                        Text(room.name)
                            .font(.system(size: 22))
                        
                        if let peculiarities = room.peculiarities {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(getRows(peculiarities: peculiarities), id: \.self) { rows in
                                    HStack {
                                        ForEach(rows, id: \.self) { row in
                                            ChipsView(peculiarities: row)
                                        }
                                    }
                                }
                            }
                        } //if

                        roomDetails()
                            .padding(.bottom, 8)

                        HStack(alignment: .bottom, spacing: 8) {
                            Text("от \(room.price) ₽")
                                .font(.system(size: 26))
                            Text(room.pricePer)
                                .foregroundColor(CustomColor.grayText)
                                .font(.system(size: 16))
                        }
                        .padding(.bottom, 8)
                        
                        NavigationLink(destination: BookingView()) {
                            ButtonView(title: Constants.Rooms.selectNumber)
                            
                        }
                        .navigationBarTitle(hotelData?.name ?? "")
                    }//VStack
                    .frame(maxWidth: .infinity)
                    .padding(.all, 16)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay {
                        if model.loading {
                            LoaderView()
                        }
                    }
                }//ForEach
            }//LazyVStack
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(CustomColor.bg)
            .navSets(navTitle: "")
        }//ScrollView
    }//body
}

extension RoomsView {
    @ViewBuilder
    func roomDetails() -> some View {
        HStack(spacing: 2) {
            Text(Constants.Rooms.moreAboutRoom)
                .foregroundColor(CustomColor.activeButton)
                .font(.system(size: 16))
            Image(.arrowTr)
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(CustomColor.activeButton)
        }//HStack
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background{
            CustomColor.activeButton
                .opacity(0.1)
        }//background
        .cornerRadius(5)
    }
}
