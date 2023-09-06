//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Mehran Kamalifard on 9/2/23.
//

import SwiftUI
import Combine
import PassGuard

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var strengthState: String = ""
    @State var strengthColor: Color = .clear
    @State var strengthScore: Float = 0.0
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("avatar")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.top, 30)
                Text("Welcome Back !")
                    .font(.custom("Avenier", size: 30.0))
                Text("Log in to your existant account ")
                    .font(.custom("Avenier", size: 17))
                VStack(spacing: 20) {
                    RoundedTextField(text: $username, placeholder: "Username")
                    RoundedTextField(text: $password, placeholder: "Password")
                        .onChange(of: password) { text in
                            let passGuard = PassGuard(password: text)
                            self.strengthState = passGuard.strengthDescription
                            self.strengthColor = Color(passGuard.strengthColor)
                            self.strengthScore = Float(passGuard.strengthScore)
                        }
                    StrengthIndicator(strengthState: $strengthState, strengthColor: $strengthColor)
                    ProgressView("", value: strengthScore, total: 100)
                        .frame(height: 50.0)
                        .tint(.gray)
                    CustomButton(label: "Login")
                }
                .padding([.leading, .trailing], 30)
                
                Spacer()
            }
            .foregroundColor(.black)
        }
    }
}

struct RoundedTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text)
            .textFieldStyle(RoundTextFieldStyle())
            .placeholder(when: text.isEmpty) {
                Text(placeholder).foregroundColor(.gray)
                    .padding(.leading, 15)
            }
    }
}

struct StrengthIndicator: View {
    @Binding var strengthState: String
    @Binding var strengthColor: Color
    
    var body: some View {
        Rectangle()
            .overlay {
                Text(strengthState)
                    .font(.custom("Avenir", size: 17))
                    .foregroundColor(.black)
            }
            .foregroundColor(strengthColor)
            .frame(height: 50, alignment: .center)
            .cornerRadius(10)
    }
}

struct CustomButton: View {
    var label: String
    
    var body: some View {
        Button(action: {}) {
            Text(label)
                .font(.custom("Avenir", size: 17))
                .foregroundColor(.white)
                .background(Color("ButtonColor"))
                .cornerRadius(8)
                .frame(width: 100, height: 50.0)
        }
        .buttonStyle(CustomButtonStyle(color: Color("ButtonColor")))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
