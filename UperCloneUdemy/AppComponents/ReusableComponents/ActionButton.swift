//
//  ActionButton.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let actionBtn:()->()
    var body: some View {
        Button {
            
        } label: {
            HStack{
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Image(systemName: "arrow.right")
                    .foregroundStyle(.black)
                
            }
            .frame(width: UIScreen.main.bounds.width-32, height: 60)//1
        }
       // .frame(width: UIScreen.main.bounds.width-32, height: 60)
        .background(Color.white)
        .cornerRadius(12)

    }
}

#Preview {
    ActionButton(title: "Sign in", actionBtn: {print("hello")})
}

//1 lma kona 7aten el frame makan el commit kan bas el text hwa el clickable bas ba2y el button mosh clickable bas lma a7tena el frame 3ala el label ely hwa el HStack ba2a kol el text clickable
