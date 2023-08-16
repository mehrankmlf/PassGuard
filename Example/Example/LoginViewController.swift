//
//  LoginViewController.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit
import Combine
import PassGuard

class LoginViewController: UIViewController, UITextFieldDelegate {
    
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
                let passGuard = PassGuard(password: password)
                self.lblState.text = passGuard.typeDescription
                self.lblState.backgroundColor = passGuard.typeColor
            }.store(in: &subscriber)
        self.progressView.progress = 40.0
    }
        
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        // Implement login flow
    }
}

extension LoginViewController {
    private func setupView() {
        self.lblState.layer.cornerRadius = 5
        self.lblState.layer.masksToBounds = true
        
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

