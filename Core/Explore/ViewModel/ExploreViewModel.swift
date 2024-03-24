//
//  ExploreViewModel.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 24.03.2024.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    @Published var listings = [ListingModel]()
    @Published var searchLoaction = ""
    private let service: ExploreSevice
    private var listingsCopy = [ListingModel]()

    init(service: ExploreSevice) {
        self.service = service
        Task {
            await fetchListings()
        }
    }

    func fetchListings() async {
        do {
            let fetchedListings = try await service.fetchListings()
            await MainActor.run {
                self.listings = fetchedListings
                self.listingsCopy = listings
            }
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }

    func updateListingsForLocation() {
        let filteredListings = listings.filter {
            $0.city.localizedCaseInsensitiveContains(searchLoaction) || $0.state.localizedCaseInsensitiveContains(searchLoaction)
        }
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
