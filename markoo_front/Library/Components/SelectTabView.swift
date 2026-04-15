//
//  tabsView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct SelectTabView : View {
    
    let label: String
    var isSelected: Bool
    
    var body: some View {
        Text(label)
            .padding(.vertical, 8)
            .padding(.horizontal, 25)
            .font(.custom("Parkinsans-medium", size: 16))
            .foregroundColor(isSelected ? .white : .grisF)
            .background(isSelected ? .violetF : .grisC)
            .cornerRadius(20)
    }
}

#Preview {
    SelectTabView(label: "À lire", isSelected: true)
}
