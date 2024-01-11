//
//  RoomsView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct RoomsView: View, Chips {
    
    @StateObject var model: RoomsViewModel = RoomsViewModel()
    @Environment(\.presentationMode) var presentation
    @Binding var activateRootLink: Bool
    let hotelData: HotelResult?
    
    
    init(hotelData: HotelResult?, activateRootLink: Binding<Bool>) {
        self.hotelData = hotelData
        self._activateRootLink = activateRootLink
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
                       
                        RoomDetailsView()
                            .padding(.bottom, 8)

                        HStack(alignment: .bottom, spacing: 8) {
                            Text("от \(room.price) ₽")
                                .font(.system(size: 26))
                            Text(room.pricePer)
                                .foregroundColor(CustomColor.grayText)
                                .font(.system(size: 16))
                        }
                        .padding(.bottom, 8)
                        
                        NavigationLink(destination: BookingView(activateRootLink: $activateRootLink)) {
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

