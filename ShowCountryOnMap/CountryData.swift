//
//  CountryData.swift
//  ShowCountryOnMap
//
//  Created by Ivica Tokic on 29/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import MapKit

class CountryData: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
