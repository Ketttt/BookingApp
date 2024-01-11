//
//  BuyerInformationView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct BuyerInformationView: View {
    
    @EnvironmentObject var model: BookingViewModel
    var mask = "+X (XXX) XXX-XX-XX"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(Constants.BuyerInformation.buyerInfo)
                .font(.system(size: 22))
                .padding(.vertical, 12)
            
            BuyerContactsTextField(title: Constants.BuyerInformation.phoneTitle, placeholder: Constants.Placeholder.phonePlaceholder, text: $model.phoneNumber, isValid: model.isPhoneValid)
                .onChange(of: model.phoneNumber) {
                    DispatchQueue.main.async {
                        model.phoneNumber = model.phoneNumber.formattedMask(text: model.phoneNumber, mask: mask)
                    }
                }
                .keyboardType(.decimalPad)

            BuyerContactsTextField(title: Constants.BuyerInformation.emailTitle, placeholder: Constants.Placeholder.emailPlaceHolder, text: $model.email, isValid: model.isEmailValid)
            
            Text(Constants.BuyerInformation.dataSafety)
                .font(.system(size: 14))
                .foregroundColor(CustomColor.grayText)
                .padding(.bottom, 16)
        }//VStack
        .padding(.horizontal, 16)
        .background(.white)
        .cornerRadius(10)
    }
}

struct BuyerInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerInformationView()
            .environmentObject(BookingViewModel())
    }
}

