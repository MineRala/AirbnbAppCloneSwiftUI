//
//  ListingImageCareuseView.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 20.03.2024.
//

import SwiftUI

struct ListingImageCareuseView: View {
    let listing: ListingModel

    var body: some View {
        TabView {
            ForEach(listing.imageUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCareuseView(listing: DeveloperPreview.shared.listings[0])
}
