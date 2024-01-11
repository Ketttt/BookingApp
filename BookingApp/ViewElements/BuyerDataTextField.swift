//
//  BuyerDataTextField.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct BuyerDataTextField: View {
    
    private var title: String
    private var placeholder: String
    private var text: Binding<String>
    private var isValid: Bool
    private var checkValid: Bool
    @FocusState private var isEmailFocused: Bool
    
    init(title: String, placeholder: String, text: Binding<String>, isValid: Bool,_ checkValid: Bool = false) {
        self.title = title
        self.text = text
        self.placeholder = placeholder
        self.isValid = isValid
        self.checkValid = checkValid
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !text.wrappedValue.isEmpty {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(CustomColor.grayText)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
            }
            
            TextField(placeholder, text: text)
                .focused($isEmailFocused)
                .textFieldStyle(CustomTextFieldStyle())
                .cornerRadius(10)
                .padding(.bottom, !text.wrappedValue.isEmpty ? 10 : 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 52)
        .background(checkValidation())
        .cornerRadius(10)
    }
    
    func checkValidation() -> Color {
        if !isEmailFocused && text.wrappedValue.isEmpty && checkValid {
            return CustomColor.invalidTextFieldBg.opacity(0.15)
        } else {
            return CustomColor.textFieldBg
        }
    }
}
