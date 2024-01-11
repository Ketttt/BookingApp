//
//  LoaderView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI

struct LoaderView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(1.5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
