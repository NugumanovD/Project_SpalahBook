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
    func didAuth()
}

protocol LoginInteractor: class {
    func login(email: String, password: String, completion: @escaping (String?, Error?) -> Void)
}

protocol LoginView: class {
    func handle(error: Error)
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
    func didLoginClick() {
        router.didAuth()
    }
    
    func registrationClick() {
        router.openRegistration()
    }
    
    func login(email: String, password: String) {
        interactor.login(email: email, password: password) { [weak self](key, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self?.view?.handle(error: error)
                    return
                }
                guard let key = key else {
                    return
                }
                Auth.current.key = key
                
                self?.router.didAuth()
            }
        }
    }
}
