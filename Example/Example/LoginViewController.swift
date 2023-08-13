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
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblState: UILabel!
    
    var subscriber = Set<AnyCancellable>()

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
    }
    
    private func setupView() {
        self.lblState.layer.cornerRadius = 5
        self.lblState.layer.masksToBounds = true
    }
    
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        
    }
}

