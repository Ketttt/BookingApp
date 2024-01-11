//
//  RoomsViewModel.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Foundation

final class RoomsViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var roomsData: RoomsResult<Room> = .init(rooms: [])
    @Published var loading = false
    let id = "8b532701-709e-4194-a41c-1a903af00195"
    
    //MARK: - init
    init(){
        Task{
            await getRooms()
        }
    }
    
//    MARK: - Networking
    @MainActor
    private func getRooms() async {
        self.loading = true
        let endpoint: Endpoint = .roomDetail(id: id)
        do {
            let result: RoomsResult<Room> = try await Networking.fetchData(from: endpoint)
            self.roomsData = result
            self.loading = false
        } catch {
            self.loading = true
        }
    }
    
}
