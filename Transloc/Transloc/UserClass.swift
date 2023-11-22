//
//  File.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import Foundation
import CoreLocation
struct Motorista : Codable, Identifiable{
    var id = UUID()
    var nome : String?
    var endPtd : String?
    var horarioPtd : String? //A mudar
    var passageiros : [Cliente]?
    var nPassageiros : Int?
}
class Motorist{
    var id = UUID()
    var nome : String?
    var endPtd : String?
    var horarioPtd : String? //A mudar
    var passageiros : [Cliente]?
    var nPassageiros : Int?
    var rota : [CLLocationCoordinate2D]
    init(nome: String, endPtd:String,horarioPtd:String,passageiros: [Cliente]){
        let semaphore = DispatchSemaphore(value: 0)
        self.nome = nome
        self.endPtd=endPtd
        self.horarioPtd=horarioPtd
        self.passageiros=passageiros
        self.rota = []
        for p in passageiros{
            self.rota.append(CLLocationCoordinate2D(latitude: p.lat!, longitude: p.long!))
            
        }
        if( rota.count == passageiros.count)
        {
            semaphore.signal()
            print(rota[0].longitude)
        }
        semaphore.wait()
        print(rota[0].longitude)
        }
       // print("Teste\(rota[0].longitude)")
        //print("Teste\(rota[1].longitude)")
    }
struct Van : Codable{
    var id = UUID()
    var nome : String?
    var motoristas :[Motorista]?
    var icon : String? //A mudar
}
class Cliente : Codable, Identifiable{
    var id = UUID()
    var nome : String?
    var endereco : String?
    var aBuscar : Bool?
    var endDestino : String?
    var horario : String?
    var foto : String?
    var dependentes : [Cliente]?
    var long : CLLocationDegrees?
    var lat : CLLocationDegrees?
    init(nome : String, endereco : String, endDestino : String, horario : String, lat: CLLocationDegrees, long: CLLocationDegrees, dependentes: [Cliente]){
        self.nome = nome
        self.endereco = endereco
        self.endDestino = endDestino
        self.horario = horario
        self.lat = lat
        self.long = long
        self.dependentes = dependentes
        /* var _ = getLatitudeFrom(address: endereco) { (latitude, error) in
         guard let latitude = latitude else {
         print("Erro ao obter latitude: \(error?.localizedDescription ?? "Desconhecido")")
         return
         }
         print("Latitude: \(latitude)")
         lat2 = latitude
         print("Lat2: \(lat2)")
         self.lat = lat2
         print("Lat: \(self.lat!)")
         }
         var _ = getLongitudeFrom(address: endereco) { (longitude, error) in
         guard let longitude = longitude else {
         print("Erro ao obter longitude: \(error?.localizedDescription ?? "Desconhecido")")
         return
         }
         print("Longitude: \(longitude)")
         long2 = longitude
         }*/
        /*geocoder.geocodeAddressString(endereco) { (placemarks, error) in
         guard let placemark = placemarks?.first,
         let location = placemark.location else {
         return
         }
         self.lat = location.coordinate.latitude
         print("latCoder \(self.lat ?? 1.0)")
         }
         print("Lat: \(self.lat ?? 0.0)")*/
    }
}
func getLongitudeFrom(address: String, completion: @escaping (_ latitude: CLLocationDegrees?, _ error: Error?) -> ()) {
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
