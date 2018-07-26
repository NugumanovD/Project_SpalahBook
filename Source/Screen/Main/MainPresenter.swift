//  
//  MainPresenter.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

protocol MainViewOutput {
    func didLoad()
    func addClickAdd()
}

final class MainPresenter {
    private var router: MainRouter?
    private weak var view: MainView?
}

extension MainPresenter: MainViewOutput {
    func addClickAdd() {
        router?.openMap()
    }

    
    func didLoad() {
        if !Auth.current.isAutorized {
            router?.authorize()
        }
    }
}

extension MainPresenter {
    func attach(router: MainRouter) {
        self.router = router
    }
    
    func attach(view: MainView) {
        self.view = view
    }
}
