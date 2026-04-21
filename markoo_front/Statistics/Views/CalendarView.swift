//
//  CalendarView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack {
            Color.violetC
            VStack {
                Text("Calendar view")
                    .font(.custom("Parkinsans-SemiBold", size: 22))
                CalendarCardView()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CalendarView()
}
