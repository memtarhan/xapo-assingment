# GitHub Trending Repos
###### Trending repos on GitHub
###### iOS 14 and later

### Tech Stack
* SwiftUI 
* UIKit 
* Swift 
* Async/Await 

### UX Details 
* First screen is '**Onboarding**' where you have info about the app and a 'Continue' button
* After tapping on 'Enter the App' (Continue) button, you'll be navigated to '**Repos**' screen. 
* Repos screen consists of a dynamic list of 'Featured' and 'Trending' repos. 
* You have a filtering UX in repos where you filter repos by timeline(weekly, daily, etc.)
* You can tap on any repo to navigate to its details. 
* In 'Details' screen, you can see info about selected repo. 
* Some details are links which you can see it on web if you tap on it. 

### Technical Details
* The project is built in mostly **SwiftUI**, 
* A custom WebViewContainer is created to demonstrate SwiftUI and UIKit interoperability
* AppDelegate is added for flexibility 
* An API helper is created(HTTPWrapper) to help with decoding API responses
* Advanced data flow logic is used (ObservableObject, @State, @Binding)
* Custom modifiers and extensions are used to demonstrate flexibility of SwiftUI 
* Respecting re-usability of components with many modularized custom components in SwiftUI
* Tests are applied to check decoding of API responses, custom Date and Int extensions. 

## Notes
* This project demonstrated flexibility and scalability of SwiftUI for production products. 
* SwiftUI does not support all of UIKit components just yet but that does not mean, you have to miss on important features of UIKit. 
* With interoperability (UIViewControllerRepresentable and UIViewRepresentable) you can have any UIKit components in your SwiftUI project.
* With SwiftUI's @StateObject, you can have source-of-truth pattern. (I did not need that in this project)


###### Enjoy!
