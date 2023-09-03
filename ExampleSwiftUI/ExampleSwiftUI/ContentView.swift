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
    
    @State var strenghtState: String = ""
    @State var strenghtColor: Color = .clear
    @State var strenghtScore: Float = 0.0
    
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
                    TextField("", text: $username)
                        .textFieldStyle(RoundTextFieldStyle())
                        .placeholder(when: username.isEmpty) {
                            Text("username").foregroundColor(.gray)
                                .padding(.leading, 15)
                        }
                    TextField("", text: $password)
                        .textFieldStyle(RoundTextFieldStyle())
                        .placeholder(when: password.isEmpty) {
                            Text("password").foregroundColor(.gray)
                                .padding(.leading, 15)
                        }
                        .onChange(of: password) { text in
                            let passGuard = PassGuard(password: text)
                            self.strenghtState = passGuard.strengthDescription
                            self.strenghtColor = Color(passGuard.strengthColor)
                            self.strenghtScore = Float(passGuard.strengthScore)
                        }
                    Rectangle()
                        .overlay {
                            Text(strenghtState)
                                .font(.custom("Avenier", size: 17))
                                .foregroundColor(.black)
                        }
                        .foregroundColor(strenghtColor)
                        .frame(height: 50, alignment: .center)
                        .cornerRadius(10)
                    ProgressView("", value: strenghtScore, total: 100)
                        .frame(height: 50.0)
                        .tint(.gray)
                    Button(action: { }, label: {
                        Text("Login")
                            .font(.custom("Avenier", size: 17))
                            .foregroundColor(.white)
                            .background(Color("ButtonColor"))
                            .cornerRadius(8)
                            .frame(width: 100, height: 50.0)
                    })
                    .buttonStyle(CustomButtonStyle(color: Color("ButtonColor")))
                }
                .padding([.leading, .trailing], 30)
                
                Spacer()
            }
            .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
