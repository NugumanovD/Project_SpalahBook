//
//  ViewController.swift
//  Project
//
//  Created by Nugumanov on 10.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.

import UIKit
protocol View: class {
    
}

class LoginViewController: UIViewController {

    @IBOutlet weak private var passTextField: UITextField!
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var registerButton: UIButton!
    @IBOutlet weak private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func registerButtonClick(_ sender: Any) {
//        let vc = UIStoryboard(name: "Auth", bundle: nil)
//        let initialVC = vc.instantiateViewController(withIdentifier: "RegisterViewController")
//        self.present(initialVC, animated: true, completion: nil)
    }
}
