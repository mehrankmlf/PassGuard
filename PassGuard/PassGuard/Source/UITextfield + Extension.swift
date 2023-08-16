//
//  UITextfield + Extension.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/8/23.
//

import UIKit
import Combine

/// An extension on `UITextField` that provides a publisher for observing text changes, available on iOS 13 and later.
public extension UITextField {
    /// A publisher that emits the updated text whenever the text field's content changes.
    ///
    /// To use this publisher, you need iOS 13 or later.
    @available(iOS 13, *)
    var passGuardTextPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .compactMap(\.text)
            .eraseToAnyPublisher()
    }
}
