//
//  InputFields.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

struct InputFields: View {
    let title:String
    let placeHolder:String
    @Binding var inputString: String
    var isSecureField = false
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField{
                SecureField(placeHolder, text: $inputString)
                    .foregroundColor(.white)
            }else{
                TextField(placeHolder, text:$inputString )
                    .foregroundColor(.white)
            }
            
            Rectangle()//3amal dah badal el Divider
                .foregroundColor(.init(white: 1, opacity: 0.4))
                .frame(width:UIScreen.main.bounds.width-32 ,height: 1)
                
        }
        .padding(.horizontal)
    }
}

#Preview {
    InputFields(title: "Email", placeHolder: "Enter email", inputString: .constant("hello"))
}
