//
//  UserAnotation.swift
//  Project
//
//  Created by Nugumanov on 26.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import MapKit

class UserAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
