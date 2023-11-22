//
//  DetDep.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI
import CoreLocation
struct DetDep: View {
    var dep : Cliente
    @State var  b : CLLocationDegrees = 0.0
    @State var  a : CLLocationDegrees = 0.0
    var body: some View {
        VStack{
            Text(dep.nome!).font(.title).frame(maxWidth: .infinity, alignment: .leading)
            Text("Partida: \(dep.endereco!)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Destino: \(dep.endDestino!)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Horário: \(dep.horario!)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Latitude: \(dep.lat ?? 1.0)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Long: \(dep.long ?? 0.0)").frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
        }.padding(.top, 20).padding(.horizontal)
    }
}

struct DetDep_Previews: PreviewProvider {
    static var previews: some View {
        let endereco = "Rua Maurilio Gomes da Silveira, 881"
        var cliente = Cliente(nome: "Thiago",endereco: endereco,endDestino: "testeDt",horario: "09:00", lat: 0, long: 0, dependentes: [])
        DetDep(dep: cliente)
    }
}
