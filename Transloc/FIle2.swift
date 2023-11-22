//
//  File.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import Foundation
struct Motoristas{
    var nome : String?
    var endPtd : String?
}
struct Van{
    var nome : String?
    var motoristas :[Motoristas]
    
}
struct Cliente{
    var nome : String?
    var endereco : String?
    var aBuscar : Bool?
    
}
