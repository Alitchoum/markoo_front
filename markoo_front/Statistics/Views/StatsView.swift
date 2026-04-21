//
//  statistics.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Text("Mes statistiques")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            CalendarCardView()
            Text("Auteurs les plus lus")
                .font(.custom("Parkinsans-Medium", size: 16))
        }
    }
}

#Preview {
    StatsView()
}
