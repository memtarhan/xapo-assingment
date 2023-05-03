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
        NavigationView {
            ZStack {
                // TODO: Move this color to constants
                Color("PrimaryBackgroundColor")
                VStack(spacing: 32) {
                    Spacer()
                    Image("logo")
                    Text("Welcome to Xapo")
                        .font(.largeTitle.bold())
                    VStack {
                        Text("iOS App for Xapo")
                        Text("This is a very fun app to use. Enjoy it!")
                    }
                    .font(.headline)
                    Spacer()

                    VStack {
                        MainButton()
                        
                    }
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
}

struct MainButton: View {
    var body: some View {
        if #available(iOS 15, *) {
            Button() {
                // TODO: Handle navigation
            } label: {
                Text("Enter the app")
                    .padding([.leading, .trailing], 64)
                    .padding([.top, .bottom], 12)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color("PrimaryBackgroundColor"))
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        } else {
            Button("Enter the app") {
                // TODO: Handle navigation
            }
            .foregroundColor(.white)
            .background(Color("PrimaryBackgroundColor"))
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
