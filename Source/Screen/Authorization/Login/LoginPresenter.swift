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
    
}

protocol LoginView: class {
    
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
    
}
