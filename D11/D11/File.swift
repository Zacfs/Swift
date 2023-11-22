//
//  File.swift
//  D11
//
//  Created by student on 26/04/23.
//

import Foundation
struct Umd : Codable{
    var _id : String?
    var _rev : String?
    var umidade : String?
}
class ViewModel : ObservableObject{
    @Published var lista : [Umd] = []
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/gettadl/") else{return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let parsed = try JSONDecoder().decode([Umd].self, from: data)
                DispatchQueue.main.async {
                    self?.lista = parsed
                }
            }
            catch{print(error)}
        }
        task.resume()
    }
}
