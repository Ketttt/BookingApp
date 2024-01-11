//
//  BookingViewModel.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import Combine
import Foundation
import SwiftUI

final class BookingViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var bookingData: BookingResult?
    @Published var tourists = [TouristData()]
    @Published var loading: Bool = false
    
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var isEmailValid = false
    @Published var isPhoneValid = false
    
    @Published var canSubmit = false
    @Published var checkValid = false
    @Published var isActiveFinishView: Bool = false
    
    let id = "63866c74-d593-432c-af8e-f279d1a8d2ff"
    
    private let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let phonePredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)
    private var cancellable: Set<AnyCancellable> = []
    
    //MARK: - init
    init(){
        configureObservers()
        Task{
            await getBooking()
        }
    }
    
    //MARK: - Configures
    private func configureObservers() {
        $tourists
            .sink { [weak self] data in
                self?.isActiveFinishView = data.map({ $0.isTouristFullData() }).allSatisfy({ $0 == true })
            }
            .store(in: &cancellable)
        
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { [weak self] email in
                return self?.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellable)
        
        $phoneNumber
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { [weak self] phone in
                
                return self?.phonePredicate.evaluate(with: phone)
            }
            .assign(to: \.isPhoneValid, on: self)
            .store(in: &cancellable)
        
        
        
        Publishers.CombineLatest($isEmailValid, $isPhoneValid)
            .map { email, phone in
                return (email && phone)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellable)
    }

    //MARK: - Networking
    @MainActor
    private func getBooking() async {
        self.loading = true
        let endpoint: Endpoint = .bookingDetail(id: id)
        do {
            let result: BookingResult = try await Networking.fetchData(from: endpoint)
            self.bookingData = result
            self.loading = false
        } catch {
            self.loading = false
        }
    }
}
