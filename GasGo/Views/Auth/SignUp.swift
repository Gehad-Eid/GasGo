//
//  SignUp.swift
//  GasGo
//
//  Created by Gehad Eid on 14/02/2024.
//

import SwiftUI
import AuthenticationServices

struct SignUp: View {
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var agreesToTerms: Bool = false
    @Binding var IsLogIn : Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Join GasGo Today")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    Text("Create your account and transform your rids")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 30)
                
                
                IconTextField(iconName: "person", placeholder: "Name", text: $name)
                
                IconTextField(iconName: "envelope", placeholder: "Email", text: $email)

                IconTextField(iconName: "lock", placeholder: "Password", text: $password, isSecure: true)
                
                
                HStack {
                    Text("Already have an account?")
                    
                    Button( "Sign in") {
                        IsLogIn = true
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
                CustomButton(buttonText: "Sign up with Apple", buttonType: .apple) {}
                
                CustomButton(buttonText: "Sign up", buttonType: .prime){
                    
                }
            }
            .padding()
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    @State static var IsLogIn = false
    static var previews: some View {
        SignUp(IsLogIn: $IsLogIn)
    }
}
