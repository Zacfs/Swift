//
//  View3.swift
//  D4
//
//  Created by student on 11/04/23.
//

import SwiftUI

struct View3: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.largeTitle).foregroundColor(.black)
        }
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
