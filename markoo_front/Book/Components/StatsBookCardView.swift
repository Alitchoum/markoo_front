//
//  StatsView.swift
//  markoo_front
//
//  Created by alize suchon on 10/04/2026.
//

import SwiftUI

struct StatsBookCardView: View {
    let picto: String
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 5){
            ZStack{
                Image(picto)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
            }
            .padding(10)
            .background(
                Circle()
                    .fill(.violetF)
            )
            
            Text(value)
                .font(.custom("Parkinsans-SemiBold", size: 18))
                .padding(.top, 9)
            Text(label)
                .font(.custom("DMSans-Regular", size: 12))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    StatsBookCardView(picto: "time1", value: "4h35", label: "Temps total")
}
