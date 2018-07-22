//
//  AuthScreen.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

final class AuthScreen {
    private weak var navigationController: UINavigationController?
    private var service: AuthService = AuthService()
    
    func start(on window: UIWindow) {
        guard let viewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("Unable to instantiate LoginViewController")
        }
        let presenter = LoginPresenter(router: self, interactor: service, view: viewController)
        viewController.attach(presenter: presenter)
        
        let navigation = UINavigationController()
        navigationController = navigation
        navigation.viewControllers = [viewController]
        window.rootViewController = navigation
    }
}

// MARK: - LoginRouter -

extension AuthScreen: LoginRouter {
    func openRegistration() {
        guard let viewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            fatalError("Unable to instantiate RegisterViewController")
        }
        
        let presenter = RegisterPresenter(router: self, interactor: service, view: viewController)
        viewController.attach(presenter: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - RegisterRouter

extension AuthScreen: RegisterRouter {
    func didRegister() {
        // TODO: OPEN MAIN APP
    }
}
