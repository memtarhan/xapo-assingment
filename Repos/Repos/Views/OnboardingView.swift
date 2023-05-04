//
//  OnboardingView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 03/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State var shouldNavigateToHome = false
    
    var body: some View {
        // TODO: NavigationView will be deprecated, should use NavigationStack
        ZStack {
            // TODO: Move this color to constants
            Color("PrimaryBackgroundColor")
            VStack {
                Spacer()
                Image("logo")

                VStack {
                    Text("Welcome to Xapo")
                        .largeTitleStyle()
                    Text("iOS App for Xapo\nThis is a very fun app to use. Enjoy it!")
                        .headlineStyle()
                }

                Spacer()

                VStack {
                    MainButton(shouldNavigateToHome: $shouldNavigateToHome)
                    Text("Terms and Privacy")
                        .linkStyle()
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        
        .toolbar {
            Button("Go to xapo") {
                // TODO: Handle navigation
                print("tapped on 'Go to Xapo' button")
            }
        }
        .foregroundColor(.white)
    }
}

struct MainButton: View {
    @Binding var shouldNavigateToHome: Bool
    
    var body: some View {
        if #available(iOS 15, *) {
            Button {
                shouldNavigateToHome.toggle()
            } label: {
                Text("Enter the app")
                    .padding([.leading, .trailing], 64)
                    .padding([.top, .bottom], 12)
            }
            .padding()
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .fullScreenCover(isPresented: $shouldNavigateToHome, content: ReposView.init)
        } else {
            Button("Enter the app") {
                // TODO: Handle navigation
            }
            .foregroundColor(.white)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
