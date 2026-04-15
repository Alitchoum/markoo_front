//
//  OjectivideEmptyView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct GoalEmptyView: View {
    var body: some View {
        VStack (spacing : 20){
            HStack(spacing : 15) {
                VStack (alignment: .leading, spacing: 8){
                    Text("Prêt(e) à te lancer ?")
                        .font(.custom("Parkinsans-SemiBold", size: 18))
                        .padding(.bottom, 10)
                    Text("Fixe ton objectif de lecture et suis ta progression.")
                        .font(.custom("DMSans-Regular", size: 16))
                        .lineSpacing(5)
                }
                .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image("markooHello")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 120)
            }
        
            
                HStack{
                    Image("plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Définir un objectif")
                        .font(.custom("Parkinsans-Medium", size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.violetF, style: StrokeStyle(lineWidth: 1.5, dash: [5, 5]))
                )
                .foregroundColor(.violetF)
            }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    GoalEmptyView()
}
