//
//  TouristTextfieldView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

@ViewBuilder
func touristTextfield(tourist: Binding<TouristData>, model: BookingViewModel) -> some View {
    
    BuyerDataTextField(title: Constants.Placeholder.name, placeholder: Constants.Placeholder.name, text: tourist.firstName, isValid: !tourist.firstName.wrappedValue.isEmpty, model.checkValid)
    
    BuyerDataTextField(title: Constants.Placeholder.secondName, placeholder: Constants.Placeholder.secondName, text: tourist.lastName, isValid: !tourist.lastName.wrappedValue.isEmpty, model.checkValid)
    
    BuyerDataTextField(title: Constants.Placeholder.birthday, placeholder: Constants.Placeholder.birthday, text: tourist.birthday, isValid: !tourist.birthday.wrappedValue.isEmpty, model.checkValid)
    
    BuyerDataTextField(title: Constants.Placeholder.passportNumber, placeholder: Constants.Placeholder.passportNumber, text: tourist.passportNumber, isValid: !tourist.passportNumber.wrappedValue.isEmpty, model.checkValid)
    
    BuyerDataTextField(title: Constants.Placeholder.citizenship, placeholder: Constants.Placeholder.citizenship, text: tourist.citizenship , isValid: !tourist.citizenship.wrappedValue.isEmpty, model.checkValid)
    
    BuyerDataTextField(title: Constants.Placeholder.expiryDate, placeholder: Constants.Placeholder.expiryDate, text: tourist.expiryDate , isValid: !tourist.expiryDate.wrappedValue.isEmpty, model.checkValid)
}
