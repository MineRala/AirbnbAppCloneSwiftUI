//
//  ProfileOptionRowView.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 24.03.2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let image: String
    let title: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        Divider()
    }
}

#Preview {
    ProfileOptionRowView(image: "gear", title: "Settings")
}
