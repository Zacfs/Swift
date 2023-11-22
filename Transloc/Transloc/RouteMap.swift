import MapKit
import SwiftUI
import CoreLocation

struct RouteMap: View {
    var motorista : Motorist
    var coordinates : [CLLocationCoordinate2D]
    @State private var directions: [String] = []
    @State private var showDirections = false
    @State private var userLocation = CLLocationCoordinate2D(latitude: -19, longitude: -149)
    // Adicione um array de coordenadas
    @State var locationManager = CLLocationManager();
    @State var c = 10
    // @State var coordinates = [CLLocationCoordinate2D]()
    var body: some View {
        ZStack{
            Color.init("1").ignoresSafeArea()
            VStack {
                MapView(directions: $directions, coordinates: coordinates, userLocation: $userLocation, locationManager: locationManager)
                    .ignoresSafeArea().cornerRadius(10)
                Button(action: {
                    self.showDirections.toggle()
                    print(coordinates)
                }, label: {
                    Text("Show directions")
                })
                .disabled(directions.isEmpty)
                .padding()
                Button(action: {
                    if(c>0){ c-=1}
                    print(coordinates)
                }, label: {
                    Text("Reduzir")
                })
            }.sheet(isPresented: $showDirections, content: {
                VStack(spacing: 0) {
                    Text("Directions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Divider().background(Color.blue)
                    
                    List(0..<self.directions.count, id: \.self) { i in
                        Text(self.directions[i]).padding()
                    }
                }
            })
            Text("\(c) pessoas ate você").padding(10).background(.yellow).cornerRadius(10).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).padding()
        }
    }
}



struct RouteMap_Previews: PreviewProvider {
  static var previews: some View {
      var motorista = Motorist(nome: "teste", endPtd: "teste", horarioPtd: "teste", passageiros: [Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "teste", lat: 42.81149, long: -73.949302, dependentes: []), Cliente(nome: "testeq", endereco: "teste", endDestino: "teste", horario: "teste", lat: 40.71, long: -74, dependentes: []),Cliente(nome: "teste", endereco: "teste", endDestino: "teste", horario: "teste", lat: 42.81149, long: -88.6322, dependentes: [])])
      RouteMap(motorista: motorista, coordinates: motorista.rota)
  }
}

