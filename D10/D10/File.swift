//
//  File.swift
//  D9
//
//  Created by student on 14/04/23.
//

import Foundation
struct Estacionamento : Codable{
    var _id : String?
    var _rev : String?
    var NomeEstacionamento : String?
    var Endereco : String?
    var vagas : Int?
    var carros : [Carro]?
}
struct Carro : Codable{
    var modelo : String?
    var ano : Int?
    var cor : String?
    var preço : Double?
}
struct Resp : Decodable{
    var results : [Estacionamento]?
}
class ViewModel : ObservableObject{
    @Published var quotes : [Estacionamento] = []
    var nome : String
    init(name : String)
    {
        self.nome = name
    }
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/getest/") else{return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                DispatchQueue.main.async {
                    self?.quotes = parsed
                }
            }
            catch{print(error)}
        }
        task.resume()
    }
}
