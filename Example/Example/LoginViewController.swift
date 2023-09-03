//
//  LoginViewController.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit
import Combine
import PassGuard

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    enum Constant {
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
        static let borderColor: UIColor = .gray
        
    }
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    private var subscriber = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtPassword.delegate = self
        self.setupView()
        self.txtPassword.passGuardTextPublisher
            .sink { password in
//                let customDescriptions = ["Way Too Short",
//                                          "Extremely Weak",
//                                          "Not So Strong",
//                                          "Fairly Strong",
//                                          "Super Strong", "Incredibly Strong"]
                let passGuard = PassGuard(password: password)
//                                          customDescription: customDescriptions)
                self.lblState.text = passGuard.strengthDescription
                self.lblState.backgroundColor = passGuard.strengthColor
                self.progressView.progress = Float(passGuard.strengthScore) / 100
            }.store(in: &subscriber)
    }
        
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        // Implement login flow
    }
}

extension LoginViewController {
    private func setupView() {
        self.lblState.layer.cornerRadius = 5
        self.lblState.layer.masksToBounds = true
        self.progressView.progress = 0.0
        self.txtUsername.attributedPlaceholder = NSAttributedString(string: "username",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.txtPassword.attributedPlaceholder = NSAttributedString(string: "password",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        self.btnLogin.layer.cornerRadius = Constant.cornerRadius
        self.btnLogin.layer.borderColor = Constant.borderColor.cgColor
        self.btnLogin.layer.borderWidth = Constant.borderWidth
        
        self.txtUsername.layer.cornerRadius = Constant.cornerRadius
        self.txtUsername.layer.borderColor = Constant.borderColor.cgColor
        self.txtUsername.layer.borderWidth = Constant.borderWidth
        
        self.txtPassword.layer.cornerRadius = Constant.cornerRadius
        self.txtPassword.layer.borderColor = Constant.borderColor.cgColor
        self.txtPassword.layer.borderWidth = Constant.borderWidth
    }
}

