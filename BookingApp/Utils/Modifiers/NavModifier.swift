//
//  NavModifier.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct NavModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentation
    let navTitle: String
    var isTitleHidden: Bool
    
    init(navTitle: String, isTitleHidden: Bool) {
        self.navTitle = navTitle
        self.isTitleHidden = isTitleHidden
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle(navTitle)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigation)  {
                    if !isTitleHidden {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .onTapGesture {
                                self.presentation.wrappedValue.dismiss()
                            }
                    }
                }
            })
    }
}
