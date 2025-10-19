//
//  FavoriteCell.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 19/10/2025.
//

import SwiftUI

struct FavoriteCell: View {
    
    let name:String
    let email:String
    
    var body: some View {
        HStack(spacing:12){
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 64,height: 64)
            
            VStack(alignment: .leading, spacing:12){
                Text(name)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(email)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .opacity(0.7)
            }
        }
    }
}

#Preview {
    FavoriteCell(name: "", email: "")
}
