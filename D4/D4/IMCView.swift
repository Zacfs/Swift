//
//  IMCView.swift
//  D4
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct IMCView: View {
    @State private var m = ""
    @State private var h = ""
    @State private var c = "1"
    @State private var h2 = 0.0
    @State private var m2 = 0.0
    @State private var i = 0.0;
    @State private var a = false;
    var body: some View {
        ZStack {
            Color.init(c).ignoresSafeArea()
            VStack{
                Text("Calculadora de IMC").font(.largeTitle).multilineTextAlignment(.leading)
                TextField("Massa", text: $m).multilineTextAlignment(.center).frame(width: 200,height: 40).background(Color.white)
                TextField("Altura", text: $h).multilineTextAlignment(.center).frame(width: 200,height: 40).background(Color.white)
                Button("Calcular"){
                    m2 = Double(m) ?? 0.0;h2 = Double(h) ?? 0.0;
                    i = m2/(h2 * h2)
                    a = true
                    if i < 18.5{
                        c = "1"
                    }
                    else if i >= 18.5 && i < 24.99{
                        c = "2"
                    }
                    else if i >= 25 && i < 29.99{
                        c = "3"
                    }
                    else if i >= 30{
                        c = "4"
                    }
                }.frame(width: 100, height:50).background(Color.blue).foregroundColor(.black).clipShape(RoundedRectangle(cornerRadius: 10)).alert(isPresented: $a) {
                    Alert(
                        title: Text("IMC"),
                        message: Text("Seu IMC é: \(i)")
                    )
                                                                                                }
               if i<18.5{
                    ZStack{
                        Text("Baixo Peso").foregroundColor(.black).multilineTextAlignment(.center).font(.title)
                    }.frame(height: 300)
                }
                else if (i >= 18.5 && i < 24.99){
                    ZStack{
                        Text("Normal").foregroundColor(.black).font(.title)
                    }.frame(height: 300)
                }
                else if (i >= 25 && i < 29.99){
                    ZStack{
                        Text("Sobrepeso").foregroundColor(.black).font(.title)
                    }.frame(height: 300)
                }
                else if (i >= 30){
                    ZStack{
                        Text("Obesidade").foregroundColor(.black).font(.title)
                    }.frame(height: 300)
                }
                Spacer()
                Image("5").resizable().scaledToFit()
            }
        }
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}
