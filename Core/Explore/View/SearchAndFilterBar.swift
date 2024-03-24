//
//  SearchAndFilterBar.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 20.03.2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere - " : "")Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule() // Köşeleri tam yuvarlak yapıyor. RoundedRectangle kullnaırsak cornerRadius belirtmemiz lazım ama Capsule tam yuvarlak yapmak için kullanışlı
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 10)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("Los Angeles"))
}
