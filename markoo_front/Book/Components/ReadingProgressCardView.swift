//
//  ReadingProgress.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct ReadingProgress: View {
    let nbTotalpages: Int
    let currentPage: Int
    var pagesRemaining: Int { (nbTotalpages - currentPage) }
    var percentage: Int { Int((Double(currentPage) / Double(nbTotalpages)) * 100) }
    
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 5 ) {
                HStack (spacing: 0 ){
                    Text("\(nbTotalpages - pagesRemaining) ")
                        .font(.custom("Parkinsans-SemiBold", size: 22))
                    Text("/ \(nbTotalpages)")
                        .font(.custom("Parkinsans-SemiBold", size: 16))
                        .foregroundColor(.grisF)
                }
                
                Text("Encore \(pagesRemaining) page(s)")
                    .font(.custom("DMSans-Regular", size: 16))
            }
            Spacer()
            ZStack{
                Text("\(percentage)%")
                    .font(.custom("Parkinsans-SemiBold", size: 22))
            }
            .padding(30)
            .background(
                Circle()
                    .stroke(.violetC, style: StrokeStyle(lineWidth: 8, lineCap: .round))
            )
            .overlay(
                Circle()
                    .trim(from: 0, to: min(Double(currentPage) / Double(nbTotalpages), 1.0))
                    .stroke(.violetF, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 25)
        .padding(.vertical, 30)
        .background(.grisC)
        .cornerRadius(20)
    }
}

#Preview {
    ReadingProgress(nbTotalpages: 453, currentPage: 53)
}
