//
//  Home.swift
//  Transloc
//
//  Created by student on 09/05/23.
//

import SwiftUI
import MapKit
import CoreLocation
struct Home: View {
    var body: some View {
        var mot = Motorist(nome: "b", endPtd: "b", horarioPtd: "b", passageiros: [Cliente(nome: "Tste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 37.809293, long: -122.477373, dependentes: []), Cliente(nome: "Tste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 37.826459, long: -122.480300, dependentes: [])])
        var motorista = Motorist(nome: "teste", endPtd: "teste", horarioPtd: "teste", passageiros: [Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "teste", lat: 40.71, long: -74, dependentes: []),Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "teste", lat: 42.81149, long: -87.630622, dependentes: []),Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "teste", lat: 41.81149, long: -87.630622, dependentes: [])])
        
        NavigationStack{
            VStack{
                NavigationLink(destination: ContentView(motorista: mot)){
                    Text("Mapa")
                }
               NavigationLink(destination: RouteMap(motorista: motorista, coordinates: [ CLLocationCoordinate2D(latitude: 40.71, longitude: -74), CLLocationCoordinate2D(latitude: 42.81149, longitude: -73.949302), CLLocationCoordinate2D(latitude: 41.880438, longitude: -87.630622)])){
                    Text("Rota")
                }
                NavigationLink(destination: RouteMap(motorista: motorista, coordinates: motorista.rota)){
                      Text("RotaTeste")
                  }
                NavigationLink(destination: DetVan(van: Van(nome: "Teste", motoristas: [Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30), Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30),Motorista(nome: "Thiago",horarioPtd: "09:00", nPassageiros: 30)], icon: "bg"))){
                    Text("Van")
                }
                NavigationLink(destination: DetCliente(cliente: Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 41.880438, long: -87.630622, dependentes: [Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: 41.880438, long: -87.630622, dependentes: [])]))){
                    Text("Cliente")
                }
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
