//
//  tagView.swift
//  markoo_front
//
//  Created by alize suchon on 10/04/2026.
//

import SwiftUI

struct tagView: View {
    let label: String
    var body: some View {
        Text(label)
            .font(.custom("DMSans-Regular", size: 14))
            .foregroundColor(.jauneF)
            .padding(.vertical, 5)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.jauneClair)
    
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.jauneF, lineWidth: 1)
            )
            
    }
}

#Preview {
    tagView(label: "Romance")
}
