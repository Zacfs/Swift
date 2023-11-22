//
//  ContentView.swift
//  Desafio1
//
//  Created by student on 05/04/23.
//

import SwiftUI
struct ContentView: View {
    @State private var showingAlert = false
    @State private var textInput = ""
    var teste = ""
    var body: some View {
        VStack {
            Text("Bem Vindo \(textInput)").font(.largeTitle).foregroundColor(.blue);
                TextField(
                    "Nome",
                    text: $textInput
                ).padding().multilineTextAlignment(.center)
            Spacer()
            Image("bg")
                .resizable().scaledToFit().edgesIgnoringSafeArea(.all)
            Spacer()
            
            Button("Entrar") {
                        showingAlert = true
                    }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Importante"), message: Text("Funciona"), dismissButton: Alert.Button.default(Text("Sair")))
                    }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
