//
//  RoundTextFieldStyle.swift
//  ExampleSwiftUI
//
//  Created by Mehran Kamalifard on 9/3/23.
//

import SwiftUI

struct RoundTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
