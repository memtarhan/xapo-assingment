//
//  OnboardingView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 03/05/2023.
//

import SwiftUI

struct OnboardingView: View {
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
                    MainButton()
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
    var body: some View {
        if #available(iOS 15, *) {
            Button {
                // TODO: Handle navigation
            } label: {
                Text("Enter the app")
                    .padding([.leading, .trailing], 64)
                    .padding([.top, .bottom], 12)
            }
            .padding()
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
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
