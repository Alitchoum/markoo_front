//
//  ObjectiveCardView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct GoalCardView: View {
    
    let markoo : String
    let description : String
    let target: Int
    let currentValue: Int
    var percentage: Int { Int((Double(currentValue) / Double(target)) * 100) }
    let label: String
    
    var body: some View {
        VStack{
            HStack (spacing: 4){
               VStack (alignment: .leading, spacing: 8){
                   Text("Ton objectif personnel")
                       .font(.custom("Parkinsans-SemiBold", size: 18))
                       .padding(.bottom, 10)
                   Text(description)
                       .font(.custom("DMSans-Regular", size: 16))
                       .lineSpacing(5)
               }
               .fixedSize(horizontal: false, vertical: true)
                
               Spacer()
               Image(markoo)
                   .resizable()
                   .scaledToFit()
                   .frame( height: 120)
           }
            .padding(.bottom, 10)
           Spacer()
           RoundedRectangle(cornerRadius: 50)
               .fill(.white)
               .frame(height: 12)
               .overlay(alignment: .leading) {
                   GeometryReader { geo in
                       RoundedRectangle(cornerRadius: 50)
                           .fill(.violetF)
                           .frame(width: geo.size.width * CGFloat(percentage) / 100)
                   }
               }
               .padding(.bottom, 7)
           
           HStack{
               Text("\(currentValue) / \(target) \(label)")
               Spacer()
               Text("\(percentage)%")
           }
           .font(.custom("Parkinsans-SemiBold", size: 16))
           
               
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .padding(25)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    GoalCardView(markoo: "markooReading", description: "Lances toi le voyage commences ici !", target: 568, currentValue: 45, label: "pages")
}
