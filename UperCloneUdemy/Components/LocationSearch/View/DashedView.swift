//
//  DashedView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import SwiftUI

struct DashedView: View {
    var body: some View {
        VStack{
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: 6, height: 6)
            
            Rectangle()
                .fill(Color(.systemGray3))
                .frame(width: 1, height: 24)
            
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: 6, height: 6)
        }
    }
}

#Preview {
    DashedView()
}
