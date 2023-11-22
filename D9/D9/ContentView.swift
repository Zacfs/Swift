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
        NavigationStack{
            TextField(
                "Nome",
                text: $textInput
            ).padding().multilineTextAlignment(.center)
            ForEach(a.quotes , id: \._id){
                q in
                NavigationLink(destination: Det(quote: q)){
                    Text("Personagem: \(q.character!)").foregroundColor(.black)
                }
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
