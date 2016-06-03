//
//  MapModel.swift
//  Cafea1e
//
//  Created by Antoine GALTIER on 03/06/2016.
//  Copyright © 2016 Teiki. All rights reserved.
//

import Foundation

class MapModel: NSObject, HttpClientDelegate {
    
    private let locationManager = CLLocationManager()
    private var mapView : GMSMapView
    
    init(mapView : GMSMapView){
        self.mapView = mapView
        super.init()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {

        let geocoder = GMSGeocoder()

        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                if let arrondissement = Int(address.postalCode!){
                    OpenDataReacher.getCafes(self, arrondissement: arrondissement)
                }
            }
        }
    }
    
    func onDataGet(data: NSData) {
        //TODO
    }
}

extension MapModel: CLLocationManagerDelegate {
    
    @objc func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {

            locationManager.startUpdatingLocation()

            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    @objc func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {

            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

            locationManager.stopUpdatingLocation()
        }
        
    }
}

extension MapModel: GMSMapViewDelegate {
    func mapView(mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
}