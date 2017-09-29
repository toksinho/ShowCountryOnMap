//
//  ViewController.swift
//  ShowCountryOnMap
//
//  Created by Ivica Tokic on 27/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var showMapBtn: UIButton!
    @IBOutlet weak var textSearchField: UITextField!
    var countryDict = [String: Any]()
    var countryData: CountryData!
    
    @IBAction func findCountryBtn(_ sender: Any) {
        
        let countryName = textSearchField.text
        let countryURL = "https://restcountries.eu/rest/v2/name/" + countryName! + "?fullText=true"

        Alamofire.request(countryURL).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if swiftyJsonVar["message"] == "Not Found" {
                    self.showMapBtn.isEnabled = false
                }
                else {
                    
                    if let restData = swiftyJsonVar[0].dictionaryObject {
                        self.countryDict = restData
                    }
                    if let name = self.countryDict["name"], let latlng = self.countryDict["latlng"] as? Array<Double>  {
                        self.countryData = CountryData(name: name as! String, latitude: latlng[0], longitude: latlng[1])
                    }
                    self.showMapBtn.isEnabled = true
                    
                }
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMapBtn.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMap"
        {
            if let destination = segue.destination as? MapViewVC {
                
                destination.countryData = self.countryData
                }
            }
        }


}

