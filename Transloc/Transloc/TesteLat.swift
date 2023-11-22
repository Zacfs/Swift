//
//  TesteLat.swift
//  Transloc
//
//  Created by student on 08/05/23.
//

import SwiftUI
import MapKit
struct TesteLat: View {
    @State var lat : CLLocationDegrees = 0.0
    @State var long : CLLocationDegrees = 0.0
    var body: some View {
        NavigationStack{
            var _: () = getLatitudeFrom(address: "Rua Maurilio Gomes Da Silveira, 881") { (latitude, error) in
                guard let latitude = latitude else {
                    print("Erro ao obter latitude: \(error?.localizedDescription ?? "Desconhecido")")
                    return
                }
                print("Latitude: \(latitude)")
                lat = latitude
            }
            var _: () = getLongitudeFro(address: "Rua Maurilio Gomes Da Silveira, 881") { (longitude, error) in
                guard let longitude = longitude else {
                    print("Erro ao obter longitude: \(error?.localizedDescription ?? "Desconhecido")")
                    return
                }
                print("Longitude: \(longitude)")
                long = longitude
            }
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("\(lat)")
                NavigationLink(destination: DetDep(dep: Cliente(nome: "Tste", endereco: "teste", endDestino: "teste", horario: "09:00", lat: lat, long: long, dependentes: []))){
                    Text("\(long)")
                }
            }
            .padding()
        }
    }
}

struct TesteLat_Previews: PreviewProvider {
    static var previews: some View {
        TesteLat()
    }
}
