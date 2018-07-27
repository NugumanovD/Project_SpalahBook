//  
//  MapPresenter.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import CoreLocation

protocol MapViewOutput {
    func didLoad()
    func place(at coordinate: CLLocationCoordinate2D)
    func postLocation(point: CLLocationCoordinate2D)
}

final class MapPresenter {
    private var router: MapRouter?
    private weak var view: MapView?
    
    private var locationService: LocationService = LocationService()
    private var geoService: GeoService = GeoService()
    private let wallService: WallService = WallService()
}

extension MapPresenter: MapViewOutput {
    func didLoad() {
        locationService.authorize()
    }
    
    func place(at coordinate: CLLocationCoordinate2D) {
        // smoothly adding location
        let annotation = UserAnnotation(coordinate: coordinate)
        view?.add(annotation: annotation)
        
        // trying to fetch details
        geoService.place(at: coordinate) { [weak self] mark, _ in
            guard let markAnnotation = mark?.annotation else { return }
            
            // smoothly replacing simple annotation with detailed one
            self?.view?.remove(annotation: annotation)
            self?.view?.add(annotation: markAnnotation)
        }
    }
    
    func postLocation(point: CLLocationCoordinate2D) {
        wallService.makePublication(latitude: Float(point.latitude), longitude: Float(point.longitude), description: "") { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.view?.handle(error: error)
                    return
                }
                self?.router?.publicationMade()
            }
        }
    }
}

extension MapPresenter {
    func attach(router: MapRouter) {
        self.router = router
    }
    
    func attach(view: MapView) {
        self.view = view
    }
}
