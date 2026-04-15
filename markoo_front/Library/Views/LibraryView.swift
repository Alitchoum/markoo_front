//
//  LibrairyView.swift
//  markoo_front
//
//  Created by alize suchon on 13/04/2026.
//

import SwiftUI

struct LibraryView: View {
    
    var tabs: [String] = ["À lire", "Terminé", "Abandoné"]
    @State private var selectedTab: String = "À lire"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 25){
            Text("Librairie")
                .font(.custom("Parkinsans-SemiBold", size: 22))
            ScrollView(.horizontal, showsIndicators: false) {
                Text("LIVRE EN COURS ICI")
            }
        
            HStack(spacing: 10) {
                ForEach(tabs, id: \.self) { tab in
                    SelectTabView(label: tab, isSelected: selectedTab == tab)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTab = tab // On change l'onglet actif
                            }
                        }
                }
            }
            
            Text("LIVRE PAR SECTION ICI / LAZYGRID")
        }
        .padding(.horizontal, 20)
    }
}
#Preview {
    LibraryView()
}
