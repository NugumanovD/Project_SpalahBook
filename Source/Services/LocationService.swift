//
//  LocationService.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import CoreLocation

class LocationService {
    private let manager = CLLocationManager()
    
    func authorize() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}
