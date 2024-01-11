//
//  ImageTabView.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import SwiftUI
import Kingfisher

struct ImageTabView: View {
    
    let items: [String]
    
    var body: some View {
        
        TabView {
            ForEach(items, id: \.self) { image in
                KFImage(URL(string: image))
                    .resizable()
                    .backgroundDecode()
                    .placeholder{
                        Image("egypt")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 257)
                    }
                    .aspectRatio(contentMode: .fill)
            }//ForEach
        }//TabView
        .tabViewStyle(.page)
        .frame(height: 257)
        .cornerRadius(5)
    }
}
