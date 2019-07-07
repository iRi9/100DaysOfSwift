//
//  ViewController.swift
//  Project16
//
//  Created by ebdesk-066 on 07/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(chooseMapType))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            if let pin = annotationView as? MKPinAnnotationView {
                pin.pinTintColor = .green
            }
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
//        let placeInfo = capital.info
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//
//        present(ac, animated: true)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.cityName = placeName
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func chooseMapType() {
        let mapTypes = ["standard","satellite","hybrid","satelliteFlyover","hybridFlyover","mutedStandard"]
        let ac = UIAlertController(title: "Choose map type", message: nil, preferredStyle: .actionSheet)
        
        for tipe in mapTypes {
            ac.addAction(UIAlertAction(title: tipe, style: .default) { action in
                switch tipe {
                case "standard":
                    self.mapView.mapType = MKMapType.standard
                case "satellite":
                    self.mapView.mapType = MKMapType.satellite
                case "hybrid":
                    self.mapView.mapType = MKMapType.hybrid
                case "satelliteFlyover":
                    self.mapView.mapType = MKMapType.satelliteFlyover
                case "hybridFlayover":
                    self.mapView.mapType = MKMapType.hybridFlyover
                case "mutedStandard":
                    self.mapView.mapType = MKMapType.mutedStandard
                default:
                    self.mapView.mapType = MKMapType.standard
                }
            })
        }
        present(ac, animated: true)
    }

}

