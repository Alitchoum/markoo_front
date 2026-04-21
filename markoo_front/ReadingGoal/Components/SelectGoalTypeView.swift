//
//  SelectGoalTypeView.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

struct SelectGoalTypeView: View {
    let picto :String
    let type :String
    let description :String
    let isSelected :Bool
    
    var body : some View {
        HStack {
            Image(picto)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(15)
                .background(.violetF)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.trailing, 10)
                
            VStack (alignment: .leading, spacing: 4){
                Text(type)
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                Text(description)
                    .foregroundColor(.grisF)
            }
            Spacer()
            
            if isSelected {
                ZStack {
                    Circle()
                        .stroke(.violetF, lineWidth: 1.5)
                        .frame(width: 25, height: 25)
                    Circle()
                        .fill(.violetF)
                        .frame(width: 17, height: 17)
                }
            } else {
                Circle()
                    .stroke(.grisF, lineWidth: 1.5)
                    .frame(width: 25, height: 25)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    SelectGoalTypeView(picto: "book-stroke", type: "Livres", description: "Nombre de livres à lire", isSelected: false)
}
