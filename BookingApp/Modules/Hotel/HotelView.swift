//
//  HotelView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct HotelView: View {
    
    @StateObject var model: HotelViewModel = HotelViewModel()
    @State var activateRootLink: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                if !model.loading {
                    ScrollView {
                        VStack(spacing: 8) {
                            BasicInfoHotelView()
                                .environmentObject(model)
                            HotelDetails()
                                .environmentObject(model)
                        }
                        .padding(.bottom, 80)
                    }//ScrollView
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(CustomColor.bg)
                    .navSets(navTitle: Constants.Hotel.navTitle)
                    
                    VStack {
                       
                        NavigationLink(isActive: $activateRootLink, destination: {
                            RoomsView(hotelData: model.hotelData, activateRootLink: $activateRootLink)
                        }, label: {
                            
                            ButtonView(title: Constants.Hotel.selectRoom)
                                .padding(.horizontal, 16)
                        })
                    }//VStack
                    .padding(.vertical, 12)
                    .background(Color.white)
                }//loading
                
                if model.loading {
                    LoaderView()
                }
            }//ZStack
        }//NavigationView
        .accentColor(.black)
    }//body
}
