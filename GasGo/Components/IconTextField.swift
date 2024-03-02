//
//  IconTextField.swift
//  GasGo
//
//  Created by Gehad Eid on 02/03/2024.
//

import SwiftUI

struct IconTextField: View {
    let iconName: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            if isSecure {
                if showPassword {
                    TextField(placeholder, text: $text)  // Show password as plain text
                        .keyboardType(keyboardType)
                } else {
                    SecureField(placeholder, text: $text)  // Hide password
                        .keyboardType(keyboardType)
                }
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
            }
            
            if isSecure {
                Button(action: {
                    self.showPassword.toggle()  // Toggle password visibility
                }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")  // Toggle eye icon
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(100)
        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.gray, lineWidth: 1))
    }
}

