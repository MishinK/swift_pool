//
//  ViewController.swift
//  d05
//
//  Created by Константин Мишин on 28.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var SegControl: UISegmentedControl!
    
    @IBAction func SegAction(_ sender: Any) {
        switch SegControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    
    var locationManager: CLLocationManager!
    var currentLatitude = Data.l[0].1
    var currentLongitude = Data.l[0].2
    var location = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
        for items in Data.l {
            let annotation = MKPointAnnotation()
            annotation.title = items.0
            annotation.subtitle = items.3
            annotation.coordinate = CLLocationCoordinate2D(latitude: items.1, longitude: items.2)
            self.mapView.addAnnotation(annotation)
        }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentLatitude, longitude: currentLongitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    @IBAction func MyGeo(_ sender: Any) {
        let coordinates = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Placemark"
        
        if(annotation is MKUserLocation) {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        if(annotation.title! == "School 21") {
            pin.pinTintColor = MKPinAnnotationView.greenPinColor()
        } else if(annotation.title! == "Ecole 42") {
            pin.pinTintColor = MKPinAnnotationView.purplePinColor()
        }
        pin.canShowCallout = true
        annotationView = pin
        return annotationView
    }
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentLatitude, longitude: currentLongitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
    }

}

