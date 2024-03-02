//
//  OnboardingView.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//

import SwiftUI
import AuthenticationServices

struct OnboardingView: View {
    private let onboardingItems = [
        OnboardingData(image: "onboarding1", title: "Exclusive sounds", description: "Find the best gas stations around you."),
        OnboardingData(image: "onboarding2", title: "Exclusive 2", description: "Rate and add gas stations to your favorites."),
        OnboardingData(image: "onboarding3", title: "Exclusive 3", description: "Get real-time updates on services availability.")
    ]
    
    @State private var currentPageIndex = 0
    @State private var skipPressed = false
    @Binding var hasCompletedOnboarding : Bool
    
    var body: some View {
        VStack {
            if currentPageIndex != onboardingItems.count - 1{
                HStack {
                    Spacer()
                    Button("Skip"){
                        currentPageIndex = onboardingItems.count - 1
                    }
                    .foregroundColor(.gray)
                    .padding()
                }
            }else{
                HStack {
                    Spacer()
                    Button(""){
                        currentPageIndex = currentPageIndex
                    }
                    .foregroundColor(.gray)
                    .padding()
                }
            }
            
            TabView(selection: $currentPageIndex) {
                ForEach(onboardingItems.indices, id: \.self) { index in
                    OnboardingPage(data: onboardingItems[index])
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.6)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Spacer()
            // Next or Login with Apple button based on the current page index
            if currentPageIndex < onboardingItems.count - 1 {
                CustomButton(buttonText: "Next", buttonType: .fav) {
                    if currentPageIndex < onboardingItems.count - 1 {
                        currentPageIndex += 1
                    }
                }
                .padding(.horizontal)
                
                
            } else {
                
                VStack {
                    CustomButton(buttonText: "Start", buttonType: .prime) {
                        hasCompletedOnboarding = true
                    }
                            
            //        VStack {
            //            SignInWithAppleButton(
            //                onRequest: { request in
            //                    // Configure request here. e.g., request.requestedScopes = [.fullName, .email]
            //                },
            //                onCompletion: { result in
            //                    // Handle authorization result
            //                }
            //            )
            //            .signInWithAppleButtonStyle(.black)
            //            .frame(height: 50)
            //            //        .padding(.bottom, 10)
            //            .cornerRadius(100)
            //
            //
            //            CustomButton(buttonText: "Sign up", buttonType: .fav) {
            //                // Action to perform when the Sign up button is tapped
            //                print("Sign up Button tapped!")
            //            }
            //        }
                }
                .padding(.horizontal)
            }

            
            
            Spacer()
        }
    }
}

struct OnboardingPage: View {
    let data: OnboardingData
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .padding()
            
            Text(data.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(data.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding()
        }
    }
}

//var signInButtons: some View {
//    VStack {
//        CustomButton(buttonText: "Start", buttonType: .prime) {
//            hasCompletedOnboarding = true
//        }
//                
////        VStack {
////            SignInWithAppleButton(
////                onRequest: { request in
////                    // Configure request here. e.g., request.requestedScopes = [.fullName, .email]
////                },
////                onCompletion: { result in
////                    // Handle authorization result
////                }
////            )
////            .signInWithAppleButtonStyle(.black)
////            .frame(height: 50)
////            //        .padding(.bottom, 10)
////            .cornerRadius(100)
////            
////            
////            CustomButton(buttonText: "Sign up", buttonType: .fav) {
////                // Action to perform when the Sign up button is tapped
////                print("Sign up Button tapped!")
////            }
////        }
//    }
//    .padding(.horizontal)
//}


struct OnboardingView_Previews: PreviewProvider {
    @State static var hasCompletedOnboarding = false 

    static var previews: some View {
        OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
    }
}
