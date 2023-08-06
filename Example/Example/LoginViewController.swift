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
        self.txtPassword.textPublisher
            .sink { password in
                let score = GuardianPars.strenghMeter(password)
                self.lblState.text = score.description
            }.store(in: &subscriber)
    }
    
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        
    }
}

