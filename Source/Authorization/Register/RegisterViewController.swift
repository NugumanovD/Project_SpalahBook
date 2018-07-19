//
//  RegisterViewController.swift
//  Project
//
//  Created by Nugumanov on 12.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.

import UIKit

class RegisterViewController: UIViewController, View {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var descriptionTextField: UITextField!
    
    @IBAction private func authorizationButtonClick(_ sender: UIButton) {
    }
    
    @IBAction private func backButtonClick(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Auth", bundle: nil)
        let initialVC = vc.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(initialVC, animated: true, completion: nil)
    }
}
