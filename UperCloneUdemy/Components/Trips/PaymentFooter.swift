//
//  PaymentFooter.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import SwiftUI

struct PaymentFooter: View {
    var body: some View {
        HStack(spacing:12) {
            Text("VISA")
                .font(.headline)
                .foregroundColor(.white)
                .padding(8)//law 7atet el padding deh fe 7eta tanya hate7'telef
                .background(Color.blue)
                .cornerRadius(4)
            
            Text("**** 1234")
                .font(.caption)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    PaymentFooter()
}
