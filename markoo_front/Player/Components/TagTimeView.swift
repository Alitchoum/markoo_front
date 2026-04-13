//
//  TagTimeView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

struct TagTimeView: View {
    let value: String
    let isSelected: Bool
    var body: some View {
        Text(value)
            .font(.custom("DMSans-Regular", size: 16))
            .foregroundColor(.violetF)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.violetC)
            )
        
            .overlay( isSelected ?
                      RoundedRectangle(cornerRadius: 15)
                .stroke(.violetF, lineWidth: 1) : nil)
    }
    
}


#Preview {
    TagTimeView(value: "15min", isSelected: true)
}
