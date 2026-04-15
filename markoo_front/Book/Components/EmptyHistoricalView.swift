//
//  EmptyHistoricalView.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

struct EmptyHistoricalView : View {
    var body: some View {
        HStack (spacing: 30){
            Image("markooWaiting")
                .resizable()
                .scaledToFit()
                .frame(width: 87, height: 96)
            
            Text("Zzzz votre historique est encore vide... Commencer votre première session !")
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
        .background(.jauneClair)
        .cornerRadius(20)
        
    }
}

#Preview {
    EmptyHistoricalView()
}
