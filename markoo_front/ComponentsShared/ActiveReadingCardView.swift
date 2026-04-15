//
//  ActiveReadingCardView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct ActiveReadingCardView: View {
    let cover: String
    let title: String
    let author: String
    let nbTotalpages: Int
    let currentPage: Int
    var percentage: Int { Int((Double(currentPage) / Double(nbTotalpages)) * 100) }
    var type: String?
    
    var body: some View {
        HStack(spacing: 15) {
            Image(cover)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 75, maxHeight: 115)
                .cornerRadius(10)
            
            VStack (alignment: .leading, spacing: 4){
                Text(title)
                    .font(.custom("Parkinsans-Medium", size: 16))
                Text(author)
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.grisF)
                Spacer()
                if let tag = type {
                    tagView(label: tag)
                }
                else {
                Text("\(currentPage) / \(nbTotalpages) pages lues")
                    .font(.custom("DMSans-Regular", size: 14))
                    .foregroundColor(.black)
            }
            
        }
        .padding(.vertical, 10)
        Spacer()
        ZStack {
            Text("\(percentage)%")
                .font(.custom("Parkinsans-SemiBold", size: 20))
        }
        .padding(30)
        .background(
            Circle()
                .stroke(.white, style: StrokeStyle(lineWidth: 7, lineCap: .round))
        )
        .overlay(
            Circle()
                .trim(from: 0, to: min(Double(currentPage) / Double(nbTotalpages), 1.0))
                .stroke(.jauneF, style: StrokeStyle(lineWidth: 7, lineCap: .round))
                .rotationEffect(.degrees(-90))
        )
    }
        .fixedSize(horizontal: false, vertical: true)
        .padding(15)
        .background(.jauneClair)
        .cornerRadius(20)
}
}

#Preview {
    ActiveReadingCardView(cover:"bookTest", title: "La fille de papier", author: "Musso", nbTotalpages: 567, currentPage: 500, type :"Romance")
}
