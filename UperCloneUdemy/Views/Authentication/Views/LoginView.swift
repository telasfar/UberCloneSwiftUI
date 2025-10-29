//
//  LoginView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State var email:String = ""
    @State var password:String = ""
    
    var body: some View {
        NavigationStack {//3ashan hane3mel navigation lel Registration page
            ZStack{
                Color.black.ignoresSafeArea()//7ab ye3melha beltare2a deh
                VStack{
                    
                    Image("uber")
                        .resizable()
                        .frame(width: 160,height: 140)
                    
                    //input fields
                    VStack(spacing: 16){
                        InputFields(title: "Email", placeHolder: "Enter your email", inputString: $email)
                        
                        InputFields(title: "Password", placeHolder: "Enter your password", inputString: $password,isSecureField: true)
                    }
                    .padding(.top,16)
                    
                    //forgot password button
                    Button {
                        print("forgot")
                    } label: {
                        Text("Forgot your password ?")
                            .font(.system(size: 13,weight: .medium))
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .padding(.trailing)
                    .frame(maxWidth: .infinity,alignment: .trailing)//lazem ye7ot el maxWidth 3ashan el alignment teshta3'al ?
                    
                    //social login
                    SocialMediaView()
                        .padding(.vertical)
                    
                    ActionButton(title: "Sign in") {
                        print("ok")
                    }
                    
                    NavigationLink {//el NavigationLink 3'er el fe el SideMenuView
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)//3ashan hwa 3amel back button 
                    } label: {
                        Text("Don't have an account ? Sign up")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .padding(.vertical)

//                    Button {//7at elnavigation link badal el button
//
//                    } label: {
//                        Text("Don't have an account ? Sign up")
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.white)
//                    }.padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
