//
//  Settings.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct Settings: View {
    @State var van2 = Van(nome: "Teste", motoristas: [Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30), Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30),Motorista(nome: "Thiago",horarioPtd: "09:00", nPassageiros: 30)], icon: "bg")
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: DetVan(van: van2)){
                    Text("Adicionar Dependente")}
                NavigationLink(destination: DetVan(van: van2)){
                    Text("Editar Perfil")}
                NavigationLink(destination: DetVan(van: van2)){
                    Text("Ver Serviços")}
                NavigationLink(destination: DetVan(van: van2)){
                    Text("Preferencias")}
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
