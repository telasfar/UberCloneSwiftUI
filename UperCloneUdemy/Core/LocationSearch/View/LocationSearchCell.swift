//
//  LocationSearchCell.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import SwiftUI

struct LocationSearchCell: View {
    var title = ""
    var subTitle = ""
    var body: some View {
        HStack{
            
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.cyan)
                .accentColor(.white)
                .frame(width: 30, height: 30)

            
            VStack(alignment: .leading,spacing: 4){
                Text(title)
                    .font(.caption)
                    
                
                Text(subTitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Divider()
            }
            .padding(.leading)
            .padding(.vertical)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchCell()
}
