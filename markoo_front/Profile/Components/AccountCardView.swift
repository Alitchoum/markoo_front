//
//  Untitled.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct AccountCardView: View {
    let picto : String
    let title : String
    
    var body: some View {
        HStack{
            Image(picto)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(15)
                .background(.rougeC)
                .foregroundColor(.rouge)
                .cornerRadius(15)
                .padding(.trailing, 8)
            
            VStack (alignment: .leading){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.rouge)
            }
            Spacer()
        }
    }
}

#Preview {
    AccountCardView(picto: "close1", title: "Déconnexion")
}
