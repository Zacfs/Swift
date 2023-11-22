//
//  ContentView.swift
//  Desafio1
//
//  Created by student on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("HT")
            .resizable().scaledToFit(); Text("HackaTruck").font(.largeTitle).foregroundColor(.blue);
            HStack{         Text("Maker").foregroundColor(.yellow).bold(); Text("Space").foregroundColor(.red).bold()
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
