//
//  HotelViewModel.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

final class HotelViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var hotelData: HotelResult?
    @Published var loading = false
    @Published var errorPopup = false
    let id = "d144777c-a67f-4e35-867a-cacc3b827473"
    
    init(){
        Task{
             await getHotels()
        }
    }
    
    //MARK: - Networking
    @MainActor
    private func getHotels() async {
        self.loading = true
        let endpoint: Endpoint = .hotelDetail(id: id)
        do {
            let result: HotelResult = try await Networking.fetchData(from: endpoint)
            self.hotelData = result
            self.loading = false
        } catch {
            self.loading = false
            errorPopup = true
        }
    }
    
}
