//
//  File.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI
final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?
    private let locationManager = CLLocationManager()
    override init() {
            super.init()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
        }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let location = locations.last else { return }
                DispatchQueue.main.async {
                    self.location = location
                }
        }
}
extension MKCoordinateRegion {
    
    static func goldenGateRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.819527098978355, longitude:  -122.47854602016669), latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
func getLatitudeFrom(address: String, completion: @escaping (_ latitude: CLLocationDegrees?, _ error: Error?) -> ()) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(address) { (placemarks, error) in
        guard let placemark = placemarks?.first,
              let location = placemark.location else {
            completion(nil, error)
            return
        }
        completion(location.coordinate.latitude, nil)
    }
}
func getLongitudeFro(address: String, completion: @escaping (_ latitude: CLLocationDegrees?, _ error: Error?) -> ()) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(address) { (placemarks, error) in
        guard let placemark = placemarks?.first,
              let location = placemark.location else {
            completion(nil, error)
            return
        }
        completion(location.coordinate.longitude, nil)
    }
}
