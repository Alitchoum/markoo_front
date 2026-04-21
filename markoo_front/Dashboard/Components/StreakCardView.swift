//
//  StreakCardView.swift
//  markoo_front
//
//  Created by alize suchon on 16/04/2026.
//

import SwiftUI

enum StreakVariant {
    case today, done, empty, future
    
    var backgroundColor: Color{
        switch self {
        case .today: return Color.jauneF
        case .done: return Color.violetF
        case .empty, .future: return Color.grisC
        }
    }
    
    var textColor: Color{
        switch self {
        case .today, .done: return Color.white
        case .empty, .future: return Color.grisF
        }
    }
}

struct StreakCardView: View {
    let variant: StreakVariant
    
    var body: some View {
        VStack (spacing: 4){
            Text("23")
                .font(.custom("Parkinsans-SemiBold", size: 18))
            Text("Mer")
                .font(.custom("DMSans-Medium", size: 14))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding()
        .background(variant.backgroundColor)
        .foregroundColor(variant.textColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    variant == .future ? Color.grisF : Color.clear,
                    style: StrokeStyle(lineWidth: 1, dash: [5, 5])
                )
        )
    }
}

#Preview {
    StreakCardView(variant: StreakVariant.future)
}
