//
//  UserInfosView.swift
//  markoo_front
//
//  Created by alize suchon on 20/04/2026.
//

import SwiftUI

struct UserInfosView: View {
    let picto: String
    let title: String
    let info : String
    let action: () -> Void
    
    var body: some View {
        
        VStack {
            HStack {
                Image(picto)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(15)
                    .background(.violet2)
                    .foregroundColor(.violetF)
                    .cornerRadius(15)
                    .padding(.trailing, 8)
                VStack (alignment: .leading){
                    Text(title)
                        .fontWeight(.semibold)
                    Text(info)
                        .foregroundColor(.grisF)
                }
                Spacer()
                Button{
                    action()
                } label: {
                    Image("caret-right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.grisF)
                }
            }
        }
    }
}

#Preview {
    UserInfosView(picto: "user-edit", title: "Prénom", info: "Emma"){
        print("ok")
    }
}
