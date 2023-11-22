//
//  View4.swift
//  D4
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct View4: View {
    @State private var c = 1
    var body: some View {
        ZStack{Color.init("\(c)")
            VStack{
                Text("Cor \(c)").foregroundColor(.white).font(.largeTitle)
                Button("Mudar"){
                    if(c<4)
                    {
                        c+=1
                    }
                    else
                    {
                        c = 1
                    }
                }.padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
            }
        }
    }
}

struct View4_Previews: PreviewProvider {
    static var previews: some View {
        View4()
    }
}
