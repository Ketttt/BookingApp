//
//  FihishView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct FihishView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(alignment: .center) {
                Image(.congratulations)
                    .frame(width: 94, height: 94)
                    .padding(.bottom, 32)
                
                Text(Constants.Finish.orderIsAccepted)
                    .font(.system(size: 22))
                    .padding(.bottom, 20)
                
                Text(Constants.Finish.confirmOfOrder)
                    .font(.system(size: 16))
                    .foregroundColor(CustomColor.grayText)
                    .multilineTextAlignment(.center)
            }//VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.white)
            
            Spacer()
        }
        .background(Color.white)
        .navSets(navTitle: Constants.NavTitle.orderHasBeenPaid)
    }
}
