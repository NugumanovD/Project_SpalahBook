//
//  RegisterPresenter.swift
//  Project
//
//  Created by Nugumanov on 12.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
import UIKit
import KeychainSwift

protocol RegisterRouter: class {
    func didRegister()
}

protocol RegisterInteractor: class {
    func register(name: String, email: String, password: String, description: String, completion: @escaping (String?, Error?) -> Void)
}
protocol RegisterView: class {
    func handle(error: Error)
}

class RegisterPresenter {
    private var router: RegisterRouter
    private var interactor: RegisterInteractor
    private var view: RegisterView?
    
    init(router: RegisterRouter, interactor: RegisterInteractor, view: RegisterView) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

// MARK: - RegisterPresenterProtocol

extension RegisterPresenter: RegisterPresenterProtocol {
    func register(name: String, email: String, password: String, description: String, image: UIImage?) {
        
        // Some check
        interactor.register(name: name, email: email, password: password, description: description) { [weak self] token, error in
            if let error = error {
                self?.view?.handle(error: error)
                return
            }
            guard let token = token else {
                let error = NSError(domain: "self", code: 0, userInfo: [NSLocalizedDescriptionKey: "No Token"])
                self?.view?.handle(error: error)
                return
            }
            Auth.current.key = token
            self?.router.didRegister()
        }
    }
}
