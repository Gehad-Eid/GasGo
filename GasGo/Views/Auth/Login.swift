//
//  Login.swift
//  GasGo
//
//  Created by Gehad Eid on 14/02/2024.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var agreesToTerms: Bool = false
    @Binding var IsLogIn : Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack (alignment: .leading){
                    Text("Welcome back!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    Text("Log in to your account and transform your rids!")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 30)
                
                
                IconTextField(iconName: "envelope", placeholder: "Email", text: $email)
                
                IconTextField(iconName: "lock", placeholder: "Password", text: $password, isSecure: true)
                
                
                HStack {
                    Text("Don't have an account?")
                    
                    Button( "Sign up") {
                        IsLogIn = false
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                
                HStack {
                    GrayLine()
                    Text("or")
                        .foregroundColor(.gray)
                    GrayLine()
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                
                // Continue with Apple Button
                CustomButton(buttonText: "Sign in with Apple", buttonType: .apple, appleSign: "in"){
                    
                }
                
                CustomButton(buttonText: "Log in", buttonType: .prime){
                    
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var IsLogIn = true
    static var previews: some View {
        Login(IsLogIn: $IsLogIn)
    }
}
