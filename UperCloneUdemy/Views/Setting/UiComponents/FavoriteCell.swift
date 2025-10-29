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
    let imgName:String
    
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imgName)
                .resizable()
                .scaledToFill()
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
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .resizable()
                .frame(width: 50,height: 50)
                .font(.caption)
        }
        
    }
}

#Preview {
    FavoriteCell(name: "ahmed", email: "test@test.com", imgName: "play.house.fill")
}
