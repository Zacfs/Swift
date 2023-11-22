//
//  File.swift
//  D9
//
//  Created by student on 14/04/23.
//

import Foundation
struct Quotes : Codable{
    var _id : String?
    var anime : String?
    var character : String?
    var quote : String?
    
}
struct Dados : Decodable{
    var anime_name : String?
    var url : String?
}
struct Resp : Decodable{
    var results : [Dados]?
}
class ViewModel : ObservableObject{
    @Published var quotes : [Quotes] = []
    var nome : String
    init(name : String)
    {
        self.nome = name
    }
    func fetch(){
        guard let url = URL(string: "https://animechan.vercel.app/api/quotes/character?name=\(nome)") else{return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let parsed = try JSONDecoder().decode([Quotes].self, from: data)
                DispatchQueue.main.async {
                    self?.quotes = parsed
                }
            }
            catch{print(error)}
        }
        task.resume()
    }
}
/*class ViewModel : ObservableObject{
    @Published var quotes : Resp = Resp()
    func fetch(){
        guard let url = URL(string: "https://nekos.best/api/v2/hug?amount=10") else{return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let parsed = try JSONDecoder().decode(Resp.self, from: data)
                DispatchQueue.main.async {
                    self?.quotes = parsed
                }
            }
            catch{print(error)}
        }
        task.resume()
    }
}*/
