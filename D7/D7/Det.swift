//
//  Det.swift
//  D7
//
//  Created by student on 12/04/23.
//

import SwiftUI

struct Det: View {
    var mus : Mus
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black],
                           startPoint: .top,
                           endPoint: .bottom).ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: mus.img)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 200, height: 200).clipShape(Rectangle()).cornerRadius(10)
               /* AsyncImage(url: URL(string: mus.img)){
                    image in
                        image.resizable()
                }placeholder: {}.frame(width: 200, height: 200).clipShape(Rectangle()).cornerRadius(10)*/
                Text(mus.nome).font(.largeTitle).foregroundColor(.white).bold().padding(2)
                Text("Autor: \(mus.artista)").font(.headline).foregroundColor(.white).padding(2)
                HStack{
                    Image(systemName: "play.circle.fill").resizable().frame(width: 30, height: 30).padding()
                    Image(systemName: "pause.circle.fill").resizable().frame(width: 30, height: 30).padding()
                    Image(systemName: "stop.circle.fill").resizable().frame(width: 30, height: 30).padding()
                }.foregroundColor(.white).padding(.vertical, 10)
            }
        }
    }
}

struct Det_Previews: PreviewProvider {
    static var previews: some View {
        let mus = Mus(id : 1, nome: "mus1", artista:"Teste", img: "https://i.imgur.com/ZBTiD9l.png")
        Det(mus : mus)
    }
}
