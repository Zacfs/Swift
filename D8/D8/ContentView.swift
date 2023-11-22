//
//  ContentView.swift
//  D8
//
//  Created by student on 13/04/23.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State var latlog = [
        Local(id: 1, lt: CLLocationCoordinate2D(latitude: 40.736573, longitude: -74.026431), nome:"NY", desc:"Cidade de Nova York", img : "ny"),
        Local(id: 2,lt: CLLocationCoordinate2D(latitude: 40.431867, longitude: 116.570386),nome:"Muralha", desc:"Muralha da China", img : "mu"),
        Local(id: 3,lt: CLLocationCoordinate2D(latitude: 48.858299, longitude: 2.294476),nome:"Torre", desc:"Torre Eiffel", img : "te"),
        Local(id: 4,lt: CLLocationCoordinate2D(latitude: 41.890122, longitude: 12.492252),nome:"Coliseu", desc:"Coliseu de Roma", img : "cl")
        ]
    @State var a = false
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -19, longitude: -43), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    @State var i = "Inicio"
    var body: some View {
        VStack{
            Text(i).font(.largeTitle)
            Map(
                coordinateRegion: $region, annotationItems: latlog){ m in
                    MapAnnotation(coordinate: m.lt){
                        Circle()
                            .onTapGesture {
                            a = true
                        }.sheet(isPresented: $a, content: {
                            VStack{
                                Text(m.nome).font(.largeTitle).bold()
                                Image(m.img).resizable().scaledToFit()
                                Text(m.desc)
                                
                            }
                        })
                    }
                }.frame(width: 400, height: 200)
            HStack{
                ForEach(latlog){ local in
                    Button(local.nome){
                        i = local.nome
                        region = MKCoordinateRegion(center: local.lt, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    }.font(.title).foregroundColor(.white).background(Color.blue).cornerRadius(5)
                }
            }.frame(maxWidth: .infinity, alignment: .leading).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
