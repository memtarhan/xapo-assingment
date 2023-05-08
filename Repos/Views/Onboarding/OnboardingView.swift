//
//  OnboardingView.swift
//  Repos
//
//  Created by Mehmet Tarhan on 03/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isPortrait = false // TODO: This can be moved to an Observable or EnvironmentObject for all views
    @State var shouldNavigateToHome = false

    var body: some View {
        ZStack {
            Color("PrimaryBackgroundColor")
                .ignoresSafeArea()

            if isPortrait {
                VStack {
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
                        TermsAndPrivacyView()
                            .padding()
                    }
                    .padding()
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateToHome, content: ReposView.init)

            } else {
                HStack(alignment: .center) {
                    Spacer()
                    VStack {
                        Image("logo")

                        VStack {
                            Text("Welcome to Xapo")
                                .largeTitleStyle()
                            Text("iOS App for Xapo\nThis is a very fun app to use. Enjoy it!")
                                .headlineStyle()
                        }
                        .foregroundColor(.white)
                    }

                    Spacer()

                    VStack {
                        MainButton(title: "Enter the App", shouldNavigateToHome: $shouldNavigateToHome)
                        TermsAndPrivacyView()
                            .padding()
                    }
                    .padding()
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigateToHome, content: ReposView.init)
            }
        }
        .onAppear {
            self.isPortrait = UIDevice.current.isPortrait
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            self.isPortrait = UIDevice.current.isPortrait
        }
    }
}

// TODO: This could be improved, move URLs to a common place
struct TermsAndPrivacyView: View {
    var body: some View {
        HStack {
            Link(destination: URL(string: "https://apple.com")!) {
                Text("Privacy Policy")
                    .underline()
            }
            Text("and")
            Link(destination: URL(string: "https://apple.com")!) {
                Text("Terms of Use")
                    .underline()
            }
        }
        .foregroundColor(.white)
        .font(.subheadline)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
