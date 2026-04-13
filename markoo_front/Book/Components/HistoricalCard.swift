//
//  HistoricCard.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct HistoricCard: View {
    let date: String
    let nbPages: Int
    let readingTime: Int
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack{
                Image("calendar1")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .padding()
            .background(
                Circle()
                    .fill(.violetC)
            )
            VStack(alignment: .leading, spacing: 5){
                Text(date)
                    .font(.custom("Parkinsans-Medium", size: 20))
                Text("\(nbPages) pages lues")
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.grisF)
            }
            Spacer()
            Text("\(readingTime) min")
                .font(.custom("Parkinsans-Medium", size: 20))
                .foregroundColor(.violetF)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .padding(.horizontal, 15)
        .background(.grisC)
        .cornerRadius(20)
    }
}

#Preview {
    HistoricCard(date: "Hier", nbPages: 24, readingTime: 34)
}
