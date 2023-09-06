![passwrod strength meter](https://github.com/mehrankmlf/PassGuard/assets/24524023/61a13094-2507-416a-9375-8f279f4fb03f)

# PassGuard

The `PassGuard` provides visual feedback to help users create stronger passwords by identifying common mistakes. We developed our own algorithms to gauge password strength since there is no official rating system available.

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

1. Strength Description : "Too Short", "Very Weak", "Weak", "Medium", "Strong", "Very Strong". The six-level return is determined by the password score and strength calculated by PassGuard. You can customize these six strings as I will explain below.
2. Strength Color : The framework returns six colors in a spectrum ranging from red to green.
3. The framework returns a score calculated using the 16 algorithms provided by PassGuard.


```swift
let passGuard = PassGuard(password: password)
self?.lblStrenght.text = passGuard.strengthDescription
self?.lblStrenght.backgroundColor = passGuard.strengthColor
self?.strenghtProgressView.progress = Float(passGuard.strengthScore) / 100
```

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