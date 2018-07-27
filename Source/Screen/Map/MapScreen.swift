//  
//  MapScreen.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

protocol MapScreenDelegate: class {
    func mapScreenDidPublication(_ screen: MapScreen)
}

protocol MapRouter {
    func publicationMade()
}

final class MapScreen {
    private weak var viewController: MapViewController?
    private weak var presenter: MapPresenter?
    
    private weak var delegate: MapScreenDelegate?
    
    init(delegate: MapScreenDelegate) {
        self.delegate = delegate
    }
    
    private func instantiateViewController() -> MapViewController {
        guard let viewController = R.storyboard.map.mapViewController() else { fatalError("Failed to load MapViewСontroller") }
        
        let presenter = MapPresenter()
        presenter.attach(router: self)
        presenter.attach(view: viewController)
        viewController.attach(output: presenter)
        
        self.presenter = presenter
        self.viewController = viewController
        
        return viewController
    }
    
    func push(to navigation: UINavigationController) {
        let viewController = instantiateViewController()
        navigation.pushViewController(viewController, animated: true)
    }
    
    func back() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

extension MapScreen: MapRouter {
    func publicationMade() {
        self.delegate?.mapScreenDidPublication(self)
    }
}
