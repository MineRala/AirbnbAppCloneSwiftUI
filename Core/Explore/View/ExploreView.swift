//
//  ExploreView.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 20.03.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreSevice())
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
                    .environmentObject(viewModel)
                // Destination Search View Animasyonla açılan bir view olduğu için present veya navigation yapmıyoruz. O yüzden explore view de kontrol ediyoruz ona göre açıyoruz.
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLoaction)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: ListingModel.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
