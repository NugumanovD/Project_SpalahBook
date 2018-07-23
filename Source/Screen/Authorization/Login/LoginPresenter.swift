//
//  Presenter.swift
//  Project
//
//  Created by Nugumanov on 12.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
import UIKit
import KeychainSwift

protocol LoginRouter: class {
    func openRegistration()
}

protocol LoginInteractor: class {
    func authorization(email: String, password: String, completion: @escaping (String?, Error?) -> Void)
}

protocol LoginView: class {
    func handleAuth(error: Error)
}

final class LoginPresenter {
    
    private var router: LoginRouter
    private var interactor: LoginInteractor
    private var view: LoginView?
    
    init(router: LoginRouter, interactor: LoginInteractor, view: LoginView) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}
extension LoginPresenter: LoginPresenterProtocol {
    func authorization(email: String, password: String) {
        
        interactor.authorization(email: email, password: password) { (token, error ) in
            if let error = error {
                self.view?.handleAuth(error: error)
                return
            }
            guard let token = token else {
                let error = NSError(domain: "self", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Token"])
                self.view?.handleAuth(error: error)
                return
            }
            Auth.current.key = token
            
        }
    }
    
    func registrationClick() {
        router.openRegistration()
    }
    
}
