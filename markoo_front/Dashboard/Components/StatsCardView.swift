//
//  statsCardView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct StatsCardView: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.custom("Parkinsans-SemiBold", size: 18))
                .padding(.bottom, 2)
            Text(label)
                .font(.custom("DMSans-Regular", size: 12))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
        .foregroundColor(.white)
        .background(.violetF)
        .cornerRadius(20)
    }
}

#Preview {
    StatsCardView(value: "23", label: "Pages lues")
}
