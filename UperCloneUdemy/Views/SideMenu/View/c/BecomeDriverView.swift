//
//  BecomeDriverView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 18/10/2025.
//

import SwiftUI

struct BecomeDriverView: View {
    var body: some View {
        VStack{
            Text("wanna be a driver ?")
                .font(.title)
                .fontWeight(.semibold)
            
            ImageTextView(imgName: "dollarsign",title: "make mony now")
        }
    }
}

#Preview {
    BecomeDriverView()
}
