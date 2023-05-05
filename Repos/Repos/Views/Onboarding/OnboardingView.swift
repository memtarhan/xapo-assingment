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
        ZStack {
            Color("PrimaryBackgroundColor")
                .ignoresSafeArea()

            AdaptiveStack {
                Spacer()
                Image("logo")

                VStack {
                    Text("Welcome to Xapo")
                        .largeTitleStyle()
                    Text("iOS App for Xapo\nThis is a very fun app to use. Enjoy it!")
                        .headlineStyle()
                }
                .foregroundColor(.white)

                Spacer()

                VStack {
                    MainButton(title: "Enter the App", shouldNavigateToHome: $shouldNavigateToHome)
                    Text("Terms and Privacy")
                        .linkStyle()
                        .foregroundColor(.white)
                }
                .padding()
            }
            .fullScreenCover(isPresented: $shouldNavigateToHome, content: ReposView.init)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
