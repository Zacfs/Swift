//
//  Det.swift
//  D9
//
//  Created by student on 14/04/23.
//

import SwiftUI

struct Det: View {
    var quote : Quotes
    var body: some View {
        VStack{
            Text("Anime:\(quote.anime!)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Frase:\(quote.character!)").frame(maxWidth: .infinity, alignment: .leading)
            Text("Frase:\(quote.quote!)").frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
    }
}

/*struct Det_Previews: PreviewProvider {
    static var previews: some View {
        Det()
    }
}*/
