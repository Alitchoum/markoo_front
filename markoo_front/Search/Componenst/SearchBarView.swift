//
//  SearchBarView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            Image("loupe")
            Text("Rechercher")
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.violetF)
        .foregroundColor(.white)
        .cornerRadius(20)
       
    }
}

#Preview {
    SearchBarView()
}
