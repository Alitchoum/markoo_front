//
//  TimerView.swift
//  markoo_front
//
//  Created by alize suchon on 10/04/2026.
//

import SwiftUI

struct TimerView: View {
    let time: String
    let color: Color
    
    var body : some View {
        HStack(spacing: 16){
            Image("timer-start")
                .resizable()
                .frame(width: 25, height: 25)
            Text(time)
                .font(.custom("Parkinsans-Medium", size: 16))
            Image("close")
                .resizable()
                .frame(width: 25, height: 25)
        }
        .foregroundColor(color)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(color, lineWidth: 1)
                
        )
        
    }
}

#Preview {
    TimerView(time: "00 : 21 : 34", color : .jauneF)
}
