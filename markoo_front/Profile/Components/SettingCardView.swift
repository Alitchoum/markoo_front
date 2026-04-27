//
//  SettingCardView.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct SettingCardView: View {
    
    let picto: String
    let title: String
    @Binding var isActive: Bool
    
    var body: some View {
        HStack{
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
            }
            Spacer()
            Toggle("", isOn: $isActive)
                .tint(.violetF)
        }
    }
}

#Preview {
    SettingCardView(picto: "moon", title: "Mode sombre", isActive: .constant(true))
}
