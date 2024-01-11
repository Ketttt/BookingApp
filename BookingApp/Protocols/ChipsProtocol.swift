//
//  ChipsProtocol.swift
//  BookingApp
//
//  Created by Katerina Ivanova on 10.01.2024.
//

import UIKit

protocol Chips {}

extension Chips {
     func getRows(peculiarities: [String]) -> [[String]] {
        var rows: [[String]] = []
        var currentRow: [String] = []
        
        var totalWidth: CGFloat = 0
        let screenWidth = UIScreen.main.bounds.width - 32
        
        peculiarities.forEach { tag in
            let font = UIFont.systemFont(ofSize: 14)
            let attr = [NSAttributedString.Key.font: font]
            let size = tag.size(withAttributes: attr).width
            
            totalWidth += (size + 45)
            
            if totalWidth > screenWidth {
                
                totalWidth = ((!currentRow.isEmpty || rows.isEmpty) ? (size + 45) : 0)
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            } else {
                currentRow.append(tag)
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}
