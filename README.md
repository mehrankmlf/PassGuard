![passwrod strength meter](https://github.com/mehrankmlf/PassGuard/assets/24524023/61a13094-2507-416a-9375-8f279f4fb03f)

# PassGuard

The `PassGuard` provides visual feedback to help users create stronger passwords by identifying common mistakes. The PassGuard using 16 algorithms and a scoring mechanism to gauge password strength since there is no official rating system available.

`The PassGuard runs on the user device as a framework and does not store or send user password over the network.`

# Requirements

`PassGuard` works on iOS 13.0+. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework
* SwiftUI.framework
* Combine.framework `optional`

## Adding PassGuard to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add PassGuard to your project.

1. Add a pod entry for PassGuard to your Podfile `pod 'PassGuard'
2. Install the pod(s) by running `pod install`.
3. Include PassGuard wherever you need it with `#import PassGuard`.

```ruby
platform :ios, '13.0'
use_frameworks!

target 'MyApp' do
    pod 'PassGuard'
end
```

### Swift Package Manager

You can use The Swift Package Manager to install PassGuard by adding the proper description to your Package.swift file:

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/mehrankmlf/PassGuard.git", from: "1.0.8"),
    ]
)
```

Then run swift build whenever you get prepared.

## Sample

You can create your custom UI based on the project.

![Simulator Screen Recording - iPhone SE (3rd generation) - 2023-09-07 at 00 09 20](https://github.com/mehrankmlf/PassGuard/assets/24524023/404e42e8-338f-4b8c-addc-2ad7be0bea18)

## Usage

(see sample Xcode project in /Example)

#### Initialization

```swift
import PassGuard
```
#### Text Publisher in UIKit

We have a Combine text publisher that allows us to stream user input from the UITextField, and there are additional solutions to capture user input efficiently when using UIKit. PassGuard offers this straightforward approach.

```swift
txtPassword.passGuardTextPublisher
      .sink { [weak self] password in
		  // password
           }
       .store(in: &cancellables)
```

#### Init PassGuard

To use PassGuard, you should create an instance from the framework to measure the user's entered password strength.

```swift
let passGuard = PassGuard(password: password)
```

#### Returns

In this version, PassGuard provides three options for building the UI responsible for displaying password details to the end user.

1. Strength Description: "Too Short", "Very Weak", "Weak", "Medium", "Strong", "Very Strong". The six-level return is determined by the password score and strength calculated by PassGuard. You can customize these six strings as I will explain below.
2. Strength Color: The framework returns six colors in a spectrum ranging from red to green.
3. Strenght Score: The framework returns a score calculated using the 16 algorithms provided by PassGuard.
4. Strenght Type: The framework returns an enum to identify the actual level of password strength. The enum cases are tooShort, veryWeak, weak, medium, strong, veryStrong which you can use to get the current state of PassGuard.

```swift
let passGuard = PassGuard(password: password)
self?.lblStrenght.text = passGuard.strengthDescription
self?.lblStrenght.backgroundColor = passGuard.strengthColor
self?.strenghtProgressView.progress = Float(passGuard.strengthScore) / 100
```

I have explained about PassGuard in the form of a post on Medium.

https://medium.com/@mehran.kmlf/boost-your-password-security-with-passguard-framework-on-ios-7faa98cc7daa

## Customize

PassGuard allows you to customize the description returned by the framework based on the password score. You simply need to create a string array with six indexes and assign it to the PassGuard instance.

```swift
let customDescriptions = ["Way Too Short",
                                  "Extremely Weak",
                                  "Not So Strong",
                                  "Fairly Strong",
                                  "Super Strong", "Incredibly Strong"]
        txtPassword.passGuardTextPublisher
            .sink { [weak self] password in
                let passGuard = PassGuard(password: password,
                                          customDescription: customDescriptions)
                self?.lblStrenght.text = passGuard.strengthDescription
                self?.lblStrenght.backgroundColor = passGuard.strengthColor
                self?.strenghtProgressView.progress = Float(passGuard.strengthScore) / 100
            }
            .store(in: &cancellables)
```

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/YourFeatureName`)
3. Commit your Changes (`git commit -m 'Add some YourFeatureName'`)
4. Push to the Branch (`git push origin feature/YourFeatureName`)
5. Open a Pull Request


## LICENSE

MIT License

Copyright (c) 2023 Related Code

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
