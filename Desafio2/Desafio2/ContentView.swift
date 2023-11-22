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
                .resizable().padding(0).scaledToFit();
            ZStack{
                    Image("bg").resizable().clipShape(Circle());
                Text("HackaTruck").font(.largeTitle).foregroundColor(.blue).padding(.bottom, 150).bold()

            }
            HStack{         Text("Maker").foregroundColor(.yellow).bold(); Text("Space").foregroundColor(.red).bold()
            }
            .padding(.horizontal, 50).padding(.top, -70).frame(maxHeight:  .infinity).background(.black)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
