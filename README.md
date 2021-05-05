# Kommunicate-SwiftPackage-Sample
An Open Source iOS Live Chat SDK for Customer Support.

## Overview
Kommunicate provides open source live chat SDK in iOS. The Kommunicate SDK is flexible, lightweight and easily integrable. It lets you easily add real-time live chat and in-app messaging in your mobile applications and websites for customer support. The SDK is equipped with advance messaging options such as sending attachments, sharing location and rich messaging.

![support-ios](https://user-images.githubusercontent.com/24476344/43457761-7d26b452-94e5-11e8-891d-ca765d589f30.gif)

Kommunicate SDK lets you integrate custom chatbots in your mobile apps for automating tasks. It comes with multiple features to make it a full-fledged customer support SDK.

![bot-ios](https://user-images.githubusercontent.com/24476344/43457795-9e019cfa-94e5-11e8-8824-5d2cfd073a94.gif)

## Get Started
To get started with the Kommunicate iOS SDK, head over to the Kommunicate website and [signup](https://dashboard.kommunicate.io/dashboard) to get your Application ID.

## Installation
Follow these steps to install and run the sample app:

- In the terminal, run: `git clone https://github.com/Kommunicate-io/Kommunicate-SPM-Sample.git`

- `cd Kommunicate-SPM-Sample`

- Open the `Kommunicate-SPM-Sample.xcodeproj` file in Xcode

- Add your App ID in the AppDelegate file, and run the app.

## Integration
Follow these steps to install to integrate the Kommunicate Swift Package in your app:

- In your project, go to File > Swift Packages > Add Package Dependency
- Enter `https://github.com/Kommunicate-io/Kommunicate-iOS-SDK` in the URL field.
- Click on Next and wait till the package is added to your project.
- Add the required [permissions](https://docs.kommunicate.io/docs/ios-installation#installation) and the [localization](https://docs.kommunicate.io/docs/ios-localization#chat-localization-setup)
- Follow the authentication process as mentioned on the [docs](https://docs.kommunicate.io/docs/ios-authentication)
- Set up views as required and launch conversations using the following function:
```swift
Kommunicate.createAndShowConversation(from: self) { error in
    guard error == nil else {
        print("Conversation error: \(error.debugDescription)")
        return
    }
    // Success
}
```
