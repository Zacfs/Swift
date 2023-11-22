//
//  AddPass.swift
//  Transloc
//
//  Created by student on 08/05/23.
//

import SwiftUI

struct AddPass: View {
    @State var cpf: String = ""
    @State var showingAlert: Bool = false
    @State var van: Motorist = Motorist(nome: "teste", endPtd: "tete", horarioPtd: "teste", passageiros: [Cliente(nome: "teste", endereco: "teste", endDestino: "tete", horario: "teste", lat: 0, long: 0, dependentes: [])])
    var body: some View {
        NavigationStack{
            VStack{
                TextField(
                    "CPF",
                    text: $cpf
                ).padding().multilineTextAlignment(.center)
                Button("Adicionar"){van.passageiros!.append(Cliente(nome: "teste", endereco: cpf, endDestino: "teste", horario: "teste", lat: 0, long: 0, dependentes: []))
                    showingAlert = true
                }.foregroundColor(.black).alert(isPresented: $showingAlert) {
                    Alert(title: Text("Confirmação"), message: Text("Adicionado"), dismissButton: Alert.Button.default(Text("Sair")))
                }
                ForEach(van.passageiros!, id: \.id){q in
                    NavigationLink(destination: DetDep(dep : q)){
                        Text("teste")
                    }
                }
            }
        }
    }
}

struct AddPass_Previews: PreviewProvider {
    static var previews: some View {
        AddPass()
    }
}
