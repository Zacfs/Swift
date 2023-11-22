//
//  ContentView.swift
//  D7
//
//  Created by student on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var musicas = [
        Mus(id : 1, nome: "Musica 1", artista: "John", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 2,nome: "Musica 2", artista: "Ana", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 3,nome: "Musica 3", artista: "Pedro", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 4,nome: "Musica 4", artista: "Amy", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 5,nome: "Musica 5", artista: "Michael", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 6,nome: "Musica 6", artista: "Kia", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 7,nome: "Musica 7", artista: "Bea", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 8,nome: "Musica 8", artista: "Josh", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 9,nome: "Musica 9", artista: "Bob", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 10,nome: "Musica 10", artista: "Pedro", img: "https://loremflickr.com/320/240/cat"),
        Mus(id : 11,nome: "Musica 11", artista: "Roberto", img: "https://loremflickr.com/320/240/cat"),
    ]
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.blue, .black],
                               startPoint: .top,
                               endPoint: .bottom).ignoresSafeArea()
                ScrollView{
                    VStack{
                        Image("bg").resizable().frame(width: 200, height: 200).cornerRadius(10).padding()
                        Text("HackaFM").foregroundColor(.white).padding().frame(maxWidth: .infinity, alignment: .leading).font(.largeTitle).bold()
                        HStack{
                            Image("bg").resizable().frame(width: 40, height: 40).cornerRadius(10).padding(10)
                            Text("HackaSong").foregroundColor(.white).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).bold()
                        }
                        ForEach(musicas.sorted(by: {$0.artista < $1.artista})){mus in
                            NavigationLink(destination: Det(mus: mus))
                            {
                                HStack{
                                    AsyncImage(url: URL(string: mus.img)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        //ProgressView()
                                    }.frame(width: 50, height: 50).clipShape(Rectangle()).cornerRadius(10)
                                    VStack{ Text("\(mus.nome)").foregroundColor(.white).bold().font(.title).frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Autor: \(mus.artista)").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    Image(systemName: "ellipsis").foregroundColor(.white)
                                }.padding().frame(maxWidth : .infinity, alignment: .leading)
                            }
                        }
                        Text("Sugestoes").foregroundColor(.white).font(.largeTitle).padding().bold().frame(maxWidth : .infinity, alignment: .leading)
                        
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(musicas.sorted(by: {$0.id > $1.id})){mus in
                                    NavigationLink(destination: Det(mus: mus))
                                    {
                                        VStack{
                                            AsyncImage(url: URL(string: mus.img)){ image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }.frame(width: 200, height: 200).clipShape(Rectangle()).cornerRadius(10)
                                            Text(mus.nome).font(.caption).foregroundColor(.white)
                                        }
                                    }.padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
