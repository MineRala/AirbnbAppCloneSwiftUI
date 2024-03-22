//
//  ListingDetailView.swift
//  AirbnbAppCloneSwiftUI
//
//  Created by Mine Rala on 20.03.2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let fatureList: [FeatureModel] = [
        FeatureModel(icon: "door.left.hand.open", title: "Self check-in", description: "Check yourself in with the keypad"),
        FeatureModel(icon: "medal", title: "Superhost", description: "Superhosts are experience, highly related hosts who are comited to providing great stars for guests")
    ]
    let offerList: [OfferModel] = [
        OfferModel(icon: "wifi", title: "wifi"),
        OfferModel(icon: "light.beacon.max", title: "alarm system"),
        OfferModel(icon: "window.vertical.closed", title: "balcony"),
        OfferModel(icon: "washer", title: "laundary"),
        OfferModel(icon: "tv", title: "tv")
        
    ]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCareuseView()
                    .frame(height: 320)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                    Text(" - ")
                    Text("28 reviews")
                        .underline()
                        .fontWeight(.semibold)
                }
                .font(.caption)
                .foregroundStyle(.black)
                Spacer(minLength: -12)
                Text("Miami, Florida")
                    .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    HStack(spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    .foregroundStyle(.black.opacity(0.8))
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                ForEach(fatureList, id: \.self) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.icon)
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.description)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16){
                        ForEach(1..<5) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging) // scrolling'i free forma getiriyor
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(offerList, id: \.self) { offer in
                    HStack {
                        Image(systemName: offer.icon)
                            .frame(width: 32)
                        Text(offer.title.capitalizeFirstLetters())
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 64) // overlay olan view'in yüksekliği kaçsa o kadar setleniyor. Scroll view' e aşağıdan o kadar padding verilmiş oluyor.
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button {}
                label: {
                    Text("Reserce")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
