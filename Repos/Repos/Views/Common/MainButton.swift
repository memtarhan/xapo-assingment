//
//  MainButton.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import SwiftUI

struct MainButton: View {
    var title: String
    @Binding var shouldNavigateToHome: Bool

    var body: some View {
        if #available(iOS 15, *) {
            MainButtonCore(title: title, shouldNavigateToHome: $shouldNavigateToHome)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
        } else {
            MainButtonCore(title: title, shouldNavigateToHome: $shouldNavigateToHome)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }
}

private struct MainButtonCore: View {
    var title: String
    @Binding var shouldNavigateToHome: Bool

    var body: some View {
        Button {
            shouldNavigateToHome.toggle()
        } label: {
            Text(title)
                .padding([.leading, .trailing], 32)
                .padding([.top, .bottom], 8)
        }
        .padding()
        .foregroundColor(.white)
    }
}


struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Main Button Sample", shouldNavigateToHome: .constant(false))
    }
}
