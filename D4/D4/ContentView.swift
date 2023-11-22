//
//  ContentView.swift
//  D4
//
//  Created by student on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            View1()
                .tabItem{
                    Label("Lista", systemImage: "list.clipboard")
                }
            IMCView()
                .tabItem{
                Label("IMC", systemImage: "sum")
            }
            View2()
                .tabItem{
                Label("Imagem", systemImage:  "photo.artframe")
            }
            View3()
                .tabItem{
                    Label("Texto", systemImage: "a")
            }
            View4()
                .tabItem{
                Label("Cor", systemImage: "paintpalette")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
