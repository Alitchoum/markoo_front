//
//  SearchView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct SearchBookView: View {
    var body: some View {
        ZStack{
            Color.violetC
            
            VStack (spacing :15){

                Text("Rechercher un livre")
                    .font(.custom("Parkinsans-Medium", size: 22))
                SearchBarView()
                ScrollView(.vertical){
                    //SI PAS TROUVÉ
                    Text("Entrez le titre, l'auteur, ou scannez son code-barres.")
                        .font(Font.custom("Parkinsans-Medium", size: 16))
                        .multilineTextAlignment(.center)
                }
                
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()

        ZStack{
            //LIEN VERS SCANNER
            Button(action: {}){
                HStack{
                    Image("scan")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Scanner le code-barres")
                        .font(Font.custom("Parkinsans-Medium", size: 16))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                .background(.violetF)
                .cornerRadius(20)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
        .background(.white)
    }
}

#Preview {
    SearchBookView()
}
