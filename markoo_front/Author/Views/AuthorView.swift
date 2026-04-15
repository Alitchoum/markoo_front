//
//  AuthorView.swift
//  markoo_front
//
//  Created by alize suchon on 09/04/2026.
//

import SwiftUI

struct AuthorView: View {
    
    let authorViewModel: AuthorViewModel
    
    var body: some View {
        
        VStack {
            Image(authorViewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(authorViewModel.lastName)
                .font(.custom("Parkinsans-Medium", size: 22))
            Text(authorViewModel.firstName)
                .font(.custom("Parkinsans-Regular", size: 16))
            
            HStack {
                ForEach(authorViewModel.infoCards) { info in
                    InfosCardView(picto: info.picto, label: info.label)
                }
            }
            Text("Bibliographie")
                .font(.custom("Parkinsans-Medium", size: 20))
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    let author = AuthorModel(
        id: UUID(),
        image: "author",
        firstName: "Guillaume",
        lastName: "Musso",
        birthDate: Calendar.current.date(from: DateComponents(year: 1974, month: 6, day: 6)) ?? Date(),
        deathDate: nil,
        nationality: "France",
        books: []
    )
    
    return AuthorView(authorViewModel: AuthorViewModel(author: author))
}
