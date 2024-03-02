//
//  ContentView.swift
//  GasGo
//
//  Created by Gehad Eid on 13/02/2024.
//

import SwiftUI

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 1.0

    var body: some View {
        VStack {
            if isActive {
                Stations()
            } else {
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(logoScale)
                        .onAppear {
                            // Start the timer to trigger the zoom animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.logoScale = 3
                                }
                                // Delay for the zoom animation to complete before switching views
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                    self.isActive = true
                                }
                            }
                        }
                    
                    Text("where service meets your every need")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Created by DevDose")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .background(Color(red: 247/255, green: 246/255, blue: 242/255))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .transition(.opacity) // Smooth transition effect when switching views
    }
}

#Preview {
    SplashScreenView()
}
