//
//  CardCalendarView.swift
//  markoo_front
//
//  Created by alize suchon on 16/04/2026.
//

import SwiftUI

struct CalendarCardView: View {
    var body: some View {
        HStack(spacing : 25){
            Image("markooCalendar")
                .resizable()
                .scaledToFit()
                .frame(width: 77, height: 101)
            
            Text("Consulter mon calendrier de lecture")
                .font(.custom("Parkinsans-Medium", size: 17))
            Image("caret-right")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(10)
                .background(.violetF)
                .clipShape(Circle())
                .foregroundColor(.white)
                
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
        .background(.violet2)
        .cornerRadius(20)
    }
}

#Preview {
   CalendarCardView()
}
