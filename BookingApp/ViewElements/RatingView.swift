//
//  RatingView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Int
    let ratingName: String
    
    var body: some View {
        HStack(spacing: 2) {
            Image(.star)
            Text(String(rating))
                .foregroundColor(CustomColor.ratingText)
                .font(.system(size: 16))
            Text(ratingName)
                .foregroundColor(CustomColor.ratingText)
                .font(.system(size: 16))
        }//HStack
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background{
            CustomColor.ratingBg
                .opacity(0.2)
        }//background
        .cornerRadius(5)
    }
}
