//
//  ListingItemView.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 20.03.2024.
//

import SwiftUI

struct ListingItemView: View {    
    var body: some View {
        VStack(spacing: 8) {
            ListingImageCareuseView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Now 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                   
                }
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
