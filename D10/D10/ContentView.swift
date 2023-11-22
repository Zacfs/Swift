//
//  ContentView.swift
//  D9
//
//  Created by student on 14/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textInput = ""
    @StateObject var a = ViewModel(name: "")
    var body: some View {
        VStack{
            TextField(
                "Nome",
                text: $textInput
            ).padding().multilineTextAlignment(.center)
            ForEach(a.quotes , id: \._id){
                q in
                Text("Estacionamento: \(q.NomeEstacionamento!)").foregroundColor(.black)
                ForEach(q.carros!, id: \.cor){ b in
                    Text("Modelo: \(b.modelo!)")
                    Text("Cor: \(b.cor!)")
                    Text("Ano: \(b.ano!)")
                    Text("Preco: \(String(format: "%.2f", Double(b.preço ?? 0.0)))")
                }
                Text("\n")
            }
            Button("Pesquisar"){
                a.nome = textInput
                a.fetch()
            }
        }.onAppear(perform: a.fetch)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
