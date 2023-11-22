//
//  View2.swift
//  D6
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct View2: View {
    var aluno : Aluno
    var body: some View {
        
        Text("Proximo: \(aluno.nome)")
        
            NavigationLink(destination: View1())
            {Text("Teste")}
        
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        var b = Aluno(
            nome: "Thiago", sobrenome: "Leao")
        View2(aluno: b)
    }
}
