//
//  DetCliente.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct DetCliente: View {
        var cliente : Cliente
    var body: some View {
        NavigationStack{
            ZStack{
                Color("1").ignoresSafeArea()
                VStack{
                    Text(cliente.nome!).font(.largeTitle).bold().padding(10)
                 //   Image(cliente.foto!).resizable().clipShape(Circle()).frame(width: 150, height: 150)
                    Text("Passageiros:").font(.largeTitle).frame(maxWidth: .infinity,alignment: .leading).padding(.horizontal)
                    ScrollView{
                        ForEach(cliente.dependentes!, id:\.id){
                            q in
                            NavigationLink(destination: DetDep(dep: q)){
                                Text(q.nome!).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal).font(.title).foregroundColor(.black).padding(.vertical, 2)
                            }
                        }
                    }
                    Spacer()
                }.frame(maxHeight:.infinity).multilineTextAlignment(.leading)
            }
        }
    }
}

struct DetCliente_Previews: PreviewProvider {
    static var previews: some View {
        var dep = Cliente(nome: "Thiago",endereco: "Teste",endDestino: "testeDt",horario: "09:00", lat: 0, long: 0, dependentes: [])
        var cliente2 = Cliente(nome: "Thiago",endereco: "Teste",endDestino: "testeDt",horario: "09:00", lat: 0, long: 0, dependentes: [dep])
        DetCliente(cliente: cliente2)
    }
}
