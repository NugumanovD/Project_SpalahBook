//
//  ViewController.swift
//  Project
//
//  Created by Nugumanov on 10.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.

import UIKit

protocol LoginPresenterProtocol {
    func registrationClick()
    func authorization(email: String, password: String)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    
    private var presenter: LoginPresenterProtocol?
    
    // MARK: - Attachments
    
    func attach(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - IBActions
    
    @IBAction func onLoginButonClick(_ sender: UIButton) {
        guard let email = emailField.text,
            let password = passwordField.text else {
                return
        }
        presenter?.authorization(email: email, password: password)
        
    }
    
    @IBAction private func onRegisterButtonClick(_ sender: Any) {
        presenter?.registrationClick()
        
    }
    
}

// MARK: - LoginView

extension LoginViewController: LoginView {
    func handleAuth(error: Error) {
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
