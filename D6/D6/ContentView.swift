//
//  ContentView.swift
//  D6
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var a = false
    var b = Aluno(
        nome: "Thiago", sobrenome: "Leao")
    var body: some View {
        NavigationStack{
            NavigationLink(destination: View1())
            {Text("Teste1")}.padding(20)
            NavigationLink(destination: View2(aluno: b))
            {Text("Teste2")}.padding(.bottom, 20)
            Button("Teste3")
            {a=true}.sheet(isPresented: $a, onDismiss: nil){
                Text("teste")
                Image("HT").resizable().scaledToFit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
