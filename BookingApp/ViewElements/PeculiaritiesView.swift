//
//  PeculiaritiesView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//


import SwiftUI

@ViewBuilder
func ChipsView(peculiarities: String) -> some View {
    
    Text(peculiarities)
        .foregroundColor(CustomColor.grayText)
        .padding(5)
        .frame(height: 29)
        .background(CustomColor.bgView)
        .cornerRadius(6)
}
