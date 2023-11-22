//
//  View1.swift
//  D4
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct View1: View {
    var body: some View {
        VStack{
            List(1...20, id: \.self){
                Text("Item \($0)")
            }.scrollContentBackground(.hidden).background(.green)
            Spacer()
        }.lineSpacing(30)
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
