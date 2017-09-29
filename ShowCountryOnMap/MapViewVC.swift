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
        
        centerMapOnLocation(coordinates: countryData.coordinate)
        mapView.addAnnotation(countryData)
        
        mapView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(coordinates: CLLocationCoordinate2D) {
        
        let regionRadius: CLLocationDistance = 150000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinates, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}


extension MapViewVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? CountryData {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                annotationView.annotation = annotation
                view = annotationView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
            }
            return view
        } else {
            return nil
        }
        
    }
}
    


