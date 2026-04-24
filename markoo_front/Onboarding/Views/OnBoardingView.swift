//
//  OnBoardingView.swift
//  markoo_front
//
//  Created by alize suchon on 23/04/2026.
//

import SwiftUI

struct OnBoardingView : View {
    let markoo: String
    let title: String
    let description: String
    
    var body: some View {

            VStack(spacing: 25){
                ZStack {
                    Image("forme")
                    Image(markoo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                }
               
                Text(title)
                    .font(.custom("Parkinsans-SemiBold", size: 22))
                Text(description)
                    .font(.custom("Parkinsans-Regular", size: 18))
                    .multilineTextAlignment(.center)
                
            }
            .padding(.horizontal, 20)
    }
}

#Preview {
    OnBoardingView(markoo: "markooLike", title: "Sessions de lecture", description: "Chronomètre chaque session et suis ta progression page après page.")
}
