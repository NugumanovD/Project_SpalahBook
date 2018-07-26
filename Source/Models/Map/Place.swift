//
//  Place.swift
//  Project
//
//  Created by Nugumanov on 26.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import CoreLocation

struct Place {
    private let placemark: CLPlacemark
    
    init(placemark: CLPlacemark) {
        self.placemark = placemark
    }
    
    var annotation: UserAnnotation? {
        guard let coordinate = placemark.location?.coordinate else { return nil }
        return UserAnnotation(coordinate: coordinate, title: placemark.name, subtitle: placemark.postalCode)
    }
}

