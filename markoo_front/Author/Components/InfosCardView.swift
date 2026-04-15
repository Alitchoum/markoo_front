//
//  InfosCardView.swift
//  markoo_front
//
//  Created by alize suchon on 15/04/2026.
//

import SwiftUI

struct InfosCardView: View {
    let picto : String
    let label : String
    
    var body: some View {
        VStack (spacing: 15){
            Image(picto)
                .resizable()
                .frame(width: 25, height: 25)
                .padding(15)
                .foregroundColor(.white)
                .background(.violetF)
                .clipShape(Circle())
                .cornerRadius(50)
               
            Text(label)
        }
        .frame(maxWidth: .infinity)
        //.frame (height: 100)
        .padding(.vertical, 20)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    InfosCardView(picto: "world", label: "France")
}
