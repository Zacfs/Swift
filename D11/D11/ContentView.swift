//
//  ContentView.swift
//  D11
//
//  Created by student on 26/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var a = ViewModel()
    var body: some View {
            ZStack{
                LinearGradient(colors: [.green, .yellow],
                               startPoint: .top,
                               endPoint: .bottom).ignoresSafeArea(.all)
                VStack{
                    Text("Atualizações Umidade").font(.largeTitle)
                    ScrollView{
                        ForEach(a.lista.reversed() , id: \._id){q in
                            HStack {
                                Image(systemName: "drop.fill")
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                                Text("Umidade Atual:\(q.umidade!)").padding(5)
                            }.background(.gray).cornerRadius(10).frame(maxWidth: .infinity, alignment: .leading).padding(5)
                        }
                    }
                }
            }.onAppear(perform:{ Timer.scheduledTimer(withTimeInterval:2.0, repeats: true) {
            time in
            a.fetch()
       }
    })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
