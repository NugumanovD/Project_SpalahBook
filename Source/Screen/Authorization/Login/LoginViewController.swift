//
//  ViewController.swift
//  Project
//
//  Created by Nugumanov on 10.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.

import UIKit

protocol LoginPresenterProtocol {
    func registrationClick()
    func login(email: String, password: String)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    
    private var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        #if DEBUG
            emailField.text = "email"
            passwordField.text = "password"
        #endif
    }
    // MARK: - Attachments
    
    func attach(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - IBActions
    
    @IBAction func onLoginButonClick(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty else {
            return
        }
        
        presenter?.login(email: email, password: password)
    }
    @IBAction private func onRegisterButtonClick(_ sender: Any) {
        presenter?.registrationClick()
        
    }
    
}

// MARK: - LoginView

extension LoginViewController: LoginView {
    func handle(error: Error) {
        print(error)
    }
    
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailField: passwordField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        }
        
        return true
    }
}
