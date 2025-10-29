//
//  RegistrationView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @Environment(\.dismiss) var dismissView
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Button {
                    dismissView()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                }
                .padding(.vertical)
                
                Text("Create new account")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)//law feh akatr men star yenzel 3ala el shemal
                
                Spacer()

                VStack(spacing:24){
                    InputFields(title: "Full name", placeHolder: "Enter your full name", inputString: $fullName)
                    
                    InputFields(title: "email", placeHolder: "Enter your email", inputString: $email)
                    
                    InputFields(title: "Password", placeHolder: "Enter your password", inputString: $password, isSecureField: true)
                    
                    InputFields(title: "Confirm Password", placeHolder: "Repeat your password", inputString: $confirmPassword, isSecureField: true)
                }//la7ez en el input fields lma et7atet 7'adet width kbeer fa za2et el vstack kolo lel leading 7ata el button we el Text beta3aha ra3'm enehom bara el Vstack
                
                Spacer()
                
                ActionButton(title: "Sign up") {
                    viewModel.registerUser(email: email, password: password,fullname: fullName)
                }
                .padding(.horizontal)
                
                Spacer()
                
            }
            .foregroundColor(.white)
            .padding(24)
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
