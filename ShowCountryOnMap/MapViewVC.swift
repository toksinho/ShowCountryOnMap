//
//  MapViewVC.swift
//  ShowCountryOnMap
//
//  Created by Ivica Tokic on 29/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit
import MapKit

class MapViewVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var countryData: CountryData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(latitude: countryData.latitude, longitude: countryData.longitude)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(latitude: Double, longitude: Double) {
        
        let regionRadius: CLLocationDistance = 150000
        let coordinates = CLLocationCoordinate2DMake(latitude,longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinates, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}
