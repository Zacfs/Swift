//
//  ContentView.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State var a = false
    var motorista: Motorist

    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        return region.getBinding()
    }

    var body: some View {
        if let region = region {
            Map(coordinateRegion: region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: motorista.passageiros!) { m in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: m.lat!, longitude: m.long!)) {
                    Circle()
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var mot = Motorist(nome: "b", endPtd: "b", horarioPtd: "b", passageiros: [Cliente(nome: "Tste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 37.809293, long: -122.477373, dependentes: []), Cliente(nome: "Tste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 37.826459, long: -122.480300, dependentes: [])])
        ContentView(motorista: mot)
    }
}
