//
//  ViewController.swift
//  App4
//
//  Created by 田代創大 on 2019/09/23.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // text fielsのdelegate先を追加
        searchField.delegate = self
    }
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var mapArea: MKMapView!
    
    func textFieldShouldReturn(_ searchField: UITextField) -> Bool {
        // キーボードを閉じる
        searchField.resignFirstResponder()
        
        if let searchKey = searchField.text {
            print(searchKey)
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarkes, error ) in
                if let unwrapPlacemark = placemarkes {
                    if let firstPlacemark = unwrapPlacemark.first {
                        if let location = firstPlacemark.location {
                            let targetCoordinate = location.coordinate
                            print(targetCoordinate)
                            
                            let pin = MKPointAnnotation()
                            
                            pin.coordinate = targetCoordinate
                            pin.title = searchKey
                            
                            self.mapArea.addAnnotation(pin)
                            
                            self.mapArea.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
                }
            })
            
            
        }
        
        return true
    }
    
    
    @IBAction func changeMapButton(_ sender: Any) {
        if mapArea.mapType == .standard {
            mapArea.mapType = .satellite
        } else if mapArea.mapType == .satellite {
            mapArea.mapType = .hybrid
        } else if mapArea.mapType == .hybrid {
            mapArea.mapType = .satelliteFlyover
        } else if mapArea.mapType == .satelliteFlyover {
            mapArea.mapType = .hybridFlyover
        } else if mapArea.mapType == .hybridFlyover {
            mapArea.mapType = .mutedStandard
        } else {
            mapArea.mapType = .standard
        }
    }
}

