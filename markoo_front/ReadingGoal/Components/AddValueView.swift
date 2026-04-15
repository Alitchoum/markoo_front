//
//  AddValueView.swift
//  markoo_front
//
//  Created by alize suchon on 14/04/2026.
//

import SwiftUI

struct AddValueView: View {
    let label : GoalType
    @State private var value: Int = 0
    
    var body: some View {
        HStack {
            Button {
                if value > 0{
                    value -= 1
                }
            } label: {
                Image("minus")
                    .foregroundColor(.white)
                    .padding(6)
                    .background(.violetF)
                    .cornerRadius(10)
            }
            Spacer()
            
            VStack {
                Text("0")
                    .font(.custom("Parkinsans-SemiBold", size: 32))
                Text(label.typeName)
                    .foregroundColor(.violetM)
                    .fontWeight(.medium)
            }
            
            Spacer()
            Button {
                    value += 1
            } label: {
                Image("plus")
                    .foregroundColor(.white)
                    .padding(6)
                    .background(.violetF)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.violetC)
        .cornerRadius(20)
    }
}

#Preview {
    AddValueView(label: GoalType.books)
}
