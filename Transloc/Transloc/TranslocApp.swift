//
//  TranslocApp.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI

@main
struct TranslocApp: App {
    var body: some Scene {
        WindowGroup {
            let endereco = "Rua Maurilio Gomes da Silveira, 881"
            var cliente = Cliente(nome: "Thiago",endereco: endereco,endDestino: "testeDt",horario: "09:00", lat: 0, long: 0, dependentes: [])
            Home()
        }
    }
}
