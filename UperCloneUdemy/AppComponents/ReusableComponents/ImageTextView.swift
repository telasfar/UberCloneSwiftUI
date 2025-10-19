//
//  ImageTextView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 18/10/2025.
//

import SwiftUI

struct ImageTextView: View {
    
    var imgName: String = ""
    var title: String = ""
    
    var body: some View {
        HStack(spacing:32){
            
            Image(systemName: imgName)
                .font(.title2)
                .imageScale(.medium)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
        }
    }
}

#Preview {
    ImageTextView()
}
