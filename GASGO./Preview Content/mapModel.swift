//
//  mapModel.swift
//  GASGO.
//
//  Created by Gehad Eid on 12/10/2023.
//

import MapKit
import _MapKit_SwiftUI

enum mapDetailes{
    static let startingLocation = CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class mapModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: mapDetailes.startingLocation, span: mapDetailes.defaultSpan))
    
    @Published var region = MKCoordinateRegion(center: mapDetailes.startingLocation, span: mapDetailes.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    // cheack if the location feature is enabeld or not
    func isLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        }else{
            print("show an alert that it's disabled")
        }
    }
    
    
    //check if the ap has the location permission
    private func checkLocationPermission(){
        guard let locationManager = locationManager else{return}
        
        
        // check what the permission the app got
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("show alert that restrected cos parentel controle")
        case .denied:
            print("go to setting")
        case .authorizedAlways, .authorizedWhenInUse:
            cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: locationManager.location!.coordinate, span: mapDetailes.defaultSpan))
        @unknown default:
            break
        }
        
    }
    
    
    // will be caled each time a locationManager is created and when the permassion is changed
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationPermission()
    }
}

