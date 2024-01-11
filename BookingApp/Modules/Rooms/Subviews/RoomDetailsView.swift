//
//  RoomDetailsView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct RoomDetailsView: View {
    
    var body: some View {
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

