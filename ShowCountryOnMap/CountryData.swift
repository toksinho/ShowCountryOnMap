//
//  CountryData.swift
//  ShowCountryOnMap
//
//  Created by Ivica Tokic on 29/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import Foundation

class CountryData {
    
    let name: String
    let latitude: Double
    let longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
