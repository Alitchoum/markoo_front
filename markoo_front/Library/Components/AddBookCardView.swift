//
//  AddBookCardView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct AddBookCardView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            Text("Aucune autre livre en cours")
                .font(.custom("Parkinsans-Medium", size: 16))
            Image("plus")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .foregroundColor(.jauneF)
                )
        }
        .frame(maxWidth: .infinity, maxHeight: 115)
        .padding(25)
        .background(.jauneClair)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.jauneF, style: StrokeStyle(lineWidth: 1.5, dash: [5, 5]))
        )
    }
}

#Preview {
    AddBookCardView()
}
