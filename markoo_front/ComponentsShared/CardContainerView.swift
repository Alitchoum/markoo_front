//
//  CardContainerview.swift
//  markoo_front
//
//  Created by alize suchon on 21/04/2026.
//

import SwiftUI

struct CardContainerView<Content : View>: View {
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0){
            content()
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    CardContainerView {
          UserInfosView(picto: "user-edit", title: "Prénom", info: "Alice")
      }
}
