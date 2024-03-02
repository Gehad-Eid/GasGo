//
//  CustomButton.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//


import SwiftUI
import AuthenticationServices

struct CustomButton: View {
    let buttonText: String
    let buttonType: ButtonType
    var appleSign = "up"
    let action: () -> Void
    
    var body: some View {
        Group {
            if buttonType == .apple {
                SignInWithAppleButton(appleSign == "up" ? .signUp : .signIn, onRequest: { request in
                    // Configure the request here.
                }, onCompletion: { result in
                    // Handle the authorization result.
                    switch result {
                    case .success(let authResults):
                        // Handle success.
                        print("Authorization successful.")
                    case .failure(let error):
                        // Handle error.
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                })
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .cornerRadius(100)
                .onTapGesture {
                    action()  // Call the action when the Apple sign-in button is tapped
                }
            } else {
                Button(action: action) {
                    Text(buttonText)
                    //                .padding()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(buttonType.backgroundColor.contrastingTextColor())
                        .background(buttonType.backgroundColor)
                        .cornerRadius(100)
                }
            }
        }
        //.padding(.horizontal)
    }
}
