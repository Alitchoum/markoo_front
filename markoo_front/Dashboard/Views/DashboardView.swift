//
//  Untitled.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        VStack {
            Text("Hello Prénom")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            Text("Max streak : 0 jours")
                .font(.custom("Parkinsans-Medium", size: 18))
            Text("Lecture en cours")
                .font(.custom("Parkinsans-Medium", size: 18))
        }
    }
}

#Preview {
    DashboardView()
}
