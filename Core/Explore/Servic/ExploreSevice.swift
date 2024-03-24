//
//  ExploreSevice.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 24.03.2024.
//

import Foundation

final class ExploreSevice {
    func fetchListings() async throws -> [ListingModel] {
        return DeveloperPreview.shared.listings
    }
}
