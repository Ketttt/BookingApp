//
//  TouristFormView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct TouristFormView: View {
    
    @EnvironmentObject var model: BookingViewModel
    @State var showingActionSheet: Bool = false
    
    var body: some View {
        ForEach($model.tourists.indices, id: \.self) { index in
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    
                    Text("\(index + 1) турист")
                        .font(.system(size: 22))
                    
                    Spacer()
                    
                    Image(.blueDownArrow)
                        .frame(width: 16, height: 16)
                        .padding(.top, 2)
                        .onTapGesture {
                            withAnimation {
                                model.tourists[index].isShowingContent.toggle()
                                model.tourists[index].isRotatingForm = model.tourists[index].isShowingContent ? -180 : 0
                            }
                        }
                        .rotationEffect(.degrees(model.tourists[index].isRotatingForm))
                }//HStack
                
                if model.tourists[index].isShowingContent  {
                    touristTextfield(tourist: $model.tourists[index], model: model)
                        .padding(.bottom, 12)
                }//if showCon
                
            }//VStack
            .padding(.all, 16)
            .background(.white)
            .cornerRadius(10)
        }
    }
}

extension TouristFormView {
    @ViewBuilder
    func touristTextfield(tourist: Binding<TouristData>, model: BookingViewModel) -> some View {
        
        BuyerDataTextField(title: Constants.Placeholder.name, placeholder: Constants.Placeholder.name, text: tourist.firstName, isValid: !tourist.firstName.wrappedValue.isEmpty, model.checkValid)
        
        BuyerDataTextField(title: Constants.Placeholder.secondName, placeholder: Constants.Placeholder.secondName, text: tourist.lastName, isValid: !tourist.lastName.wrappedValue.isEmpty, model.checkValid)
        
        BuyerDataTextField(title: Constants.Placeholder.birthday, placeholder: Constants.Placeholder.birthday, text: tourist.birthday, isValid: !tourist.birthday.wrappedValue.isEmpty, model.checkValid)
        
        BuyerDataTextField(title: Constants.Placeholder.passportNumber, placeholder: Constants.Placeholder.passportNumber, text: tourist.passportNumber, isValid: !tourist.passportNumber.wrappedValue.isEmpty, model.checkValid)
        
        BuyerDataTextField(title: Constants.Placeholder.citizenship, placeholder: Constants.Placeholder.citizenship, text: tourist.citizenship , isValid: !tourist.citizenship.wrappedValue.isEmpty, model.checkValid)
        
        BuyerDataTextField(title: Constants.Placeholder.expiryDate, placeholder: Constants.Placeholder.expiryDate, text: tourist.expiryDate , isValid: !tourist.expiryDate.wrappedValue.isEmpty, model.checkValid)
    }
}
