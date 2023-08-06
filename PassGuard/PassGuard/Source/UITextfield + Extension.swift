//
//  UITextfield + Extension.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/8/23.
//

import UIKit
import Combine

public extension UITextField {
    @available(iOS 13, *)
    var passGuardTextPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .compactMap(\.text)
            .eraseToAnyPublisher()
    }
}
