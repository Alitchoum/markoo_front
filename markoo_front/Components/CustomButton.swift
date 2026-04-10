//
//  Button.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

enum ButtonVariant{
    case purple
    case gray
    case yellow
    
    var backgroundColor: Color{
        switch self {
        case .purple:
            return Color.violetF
        case .gray:
            return Color.grisC
        case .yellow:
            return Color.jauneF
        }
    }
    
    var textColor: Color{
        switch self {
        case .purple, .yellow:
            return Color.white
        case .gray:
            return Color.grisF
        }
    }
}

struct CustomButton : View {
    let title: String
    let variant: ButtonVariant
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.custom("Parkinsans-Medium", size: 16))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .foregroundColor(variant.textColor)
                .background(variant.backgroundColor)
                .cornerRadius(20)
                
        }
    }
}

#Preview {
    CustomButton(title: "Valider", variant: .gray){
        print("ok!")
    }
}
