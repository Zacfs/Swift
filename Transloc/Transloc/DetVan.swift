//
//  SwiftUIView.swift
//  Transloc
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct DetVan: View {
    var van : Van
    var body: some View {
        ZStack{
            Color("1").ignoresSafeArea()
             VStack{
                Text(van.nome!).font(.largeTitle).bold()
                Image(van.icon!).resizable().clipShape(Circle()).frame(width: 150, height: 150)
                 ScrollView{
                     ForEach(van.motoristas!, id:\.nome){
                         q in
                         VStack{
                             Text(q.nome!).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal).font(.title)
                             Text("Horario:  \(q.horarioPtd!)").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal).font(.title)
                             Text("Passageiros:  \(q.nPassageiros!)").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal).font(.title)
                         }.background(.gray).cornerRadius(20).padding(.horizontal, 50).padding(.vertical, 10)
                     }
                 }
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        var van2 = Van(nome: "Teste", motoristas: [Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30), Motorista(nome: "Thiago",horarioPtd: "09:00",nPassageiros: 30),Motorista(nome: "Thiago",horarioPtd: "09:00", nPassageiros: 30)], icon: "bg")
        DetVan(van: van2)
    }
}
