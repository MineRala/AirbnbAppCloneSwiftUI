//
//  String.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 22.03.2024.
//

import Foundation

extension String {
    func capitalizeFirstLetters() -> String {
        return split(separator: " ").map { String($0).capitalizedFirstLetter() }.joined(separator: " ")
    }
    
    private func capitalizedFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
