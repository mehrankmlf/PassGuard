//
//  CustomButtonStyle.swift
//  ExampleSwiftUI
//
//  Created by Mehran Kamalifard on 9/3/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {

    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

