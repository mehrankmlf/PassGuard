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
    
    // MARK: - Constants
    enum Constant {
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
        static let borderColor: UIColor = .gray
    }
    
    // MARK: - Outlets
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStrenght: UILabel!
    @IBOutlet weak var strenghtProgressView: UIProgressView!
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtPassword.delegate = self
        self.setupUI()
        self.setupPasswordStrengthSubscriber()
    }
    // MARK: - Actions
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        // Implement login flow
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        setupLabel(lblStrenght)
        setupTextField(txtUsername, placeholder: "Username")
        setupTextField(txtPassword, placeholder: "Password")
        setupButton(btnLogin)
    }
    
    private func setupLabel(_ label: UILabel) {
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.layer.cornerRadius = Constant.cornerRadius
        textField.layer.borderColor = Constant.borderColor.cgColor
        textField.layer.borderWidth = Constant.borderWidth
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.delegate = self
    }
    
    private func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = Constant.cornerRadius
        button.layer.borderColor = Constant.borderColor.cgColor
        button.layer.borderWidth = Constant.borderWidth
    }
    
    private func setupPasswordStrengthSubscriber() {
        txtPassword.passGuardTextPublisher
            .sink { [weak self] password in
                let passGuard = PassGuard(password: password)
                self?.lblStrenght.text = passGuard.strengthDescription
                self?.lblStrenght.backgroundColor = passGuard.strengthColor
                self?.strenghtProgressView.progress = Float(passGuard.strengthScore) / 100
            }
            .store(in: &cancellables)
    }
    
    private func setupPasswordStrengthWithCustomDescriptionSubscriber() {
        let customDescriptions = ["Way Too Short",
                                  "Extremely Weak",
                                  "Not So Strong",
                                  "Fairly Strong",
                                  "Super Strong", "Incredibly Strong"]
        txtPassword.passGuardTextPublisher
            .sink { [weak self] password in
                let passGuard = PassGuard(password: password,
                                          customDescription: customDescriptions)
                self?.lblStrenght.text = passGuard.strengthDescription
                self?.lblStrenght.backgroundColor = passGuard.strengthColor
                self?.strenghtProgressView.progress = Float(passGuard.strengthScore) / 100
            }
            .store(in: &cancellables)
    }
}

