//
//  RegisterViewController.swift
//  Project
//
//  Created by Nugumanov on 12.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.

import UIKit
protocol RegisterPresenterProtocol {
    func register(name: String, email: String, password: String, description: String, image: UIImage?)
}
class RegisterViewController: UIViewController {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    private var presenter: RegisterPresenterProtocol?
    
    // MARK: - Attachments
    
    func attach(presenter: RegisterPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - IBActions
    
    @IBAction private func authorizationButtonClick(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let description = descriptionTextView.text else {
                // IS EMPTY
                // TEXT USER
                return
        }
        
        // CHECK IF EMPTY
        
        let image = imageView.image
        presenter?.register(name: name, email: email, password: password, description: description, image: image)
        
    }
    
    @IBAction private func backButtonClick(_ sender: UIButton) {
        
    }
}

// MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - RegisterView

extension RegisterViewController: RegisterView {
    func handle(error: Error) {
        print(error)
    }
}
