//
//  ContentView.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var hasCompletedOnboarding = false
    @State private var IsLogIn = false

    var body: some View {
        if hasCompletedOnboarding {
            if IsLogIn {
                Login(IsLogIn: $IsLogIn)
            } else {
                SignUp(IsLogIn: $IsLogIn)
            }
        } else {
            OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
        }
    }
}


#Preview {
    ContentView()
}
