import MapKit
import SwiftUI
import CoreLocation

struct RouteMap: View {
    @State private var directions: [String] = []
    @State private var showDirections = false
    @State private var userLocation = CLLocationCoordinate2D(latitude: -19, longitude: -149)
    @State var r = 0
    // Adicione um array de coordenadas
    @State var coordinates = [
        CLLocationCoordinate2D(latitude: 40.71, longitude: -74), // NYC
        CLLocationCoordinate2D(latitude: 42.81149, longitude: -73.949302), // Boston
        //  CLLocationCoordinate2D(latitude: 41.880438, longitude: -87.630622), // Chicago
        //  CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437) // Los Angeles
    ]
    @State var locationManager = CLLocationManager();
    // @State var coordinates = [CLLocationCoordinate2D]()
    var body: some View {
        VStack {
            Button("Rota"){coordinates.append(CLLocationCoordinate2D(latitude: 41.880438, longitude: -87.630622))
                print("l")
                print(coordinates[r].latitude)
            }
            MapView(directions: $directions, coordinates: coordinates, userLocation: $userLocation, locationManager: locationManager)
                .ignoresSafeArea()
            Text("Lat: \(userLocation.latitude), Lon: \(userLocation.longitude)")
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show directions")
            })
            .disabled(directions.isEmpty)
            .padding()
            .padding()
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
    }
    
    
    struct MapView: UIViewRepresentable {
        typealias UIViewType = MKMapView
        
        @Binding var directions: [String]
        
        @State var coordinates: [CLLocationCoordinate2D]
        @Binding var userLocation: CLLocationCoordinate2D
        @State var locationManager = CLLocationManager()
        
        func makeCoordinator() -> MapViewCoordinator {
            return MapViewCoordinator()
        }
        func addcord(){
            coordinates.append(CLLocationCoordinate2D(latitude: 41.880438, longitude: -87.630622))
        }
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            mapView.showsUserLocation = true
            mapView.delegate = context.coordinator
            
            // Defina o centro e a região do mapa
            let center = coordinates.first!
            let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
            
            // Adicione os marcadores dos pontos
            for coordinate in coordinates {
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                mapView.addAnnotation(annotation)
            }
            
            // Adicione uma solicitação de direções para cada par de pontos
            for i in 0..<coordinates.count-1 {
                let request = MKDirections.Request()
                
                
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: coordinates[i]))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinates[i+1]))
                request.transportType = .automobile
                
                
                let directions = MKDirections(request: request)
                directions.calculate { response, error in
                    guard let route = response?.routes.first else { return }
                    mapView.addOverlay(route.polyline)
                    self.directions.append(contentsOf: route.steps.map { $0.instructions }.filter { !$0.isEmpty })
                }
            }
            
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
        }
        
        
        class MapViewCoordinator: NSObject, MKMapViewDelegate {
            func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = .systemBlue
                renderer.lineWidth = 5
                return renderer
            }
        }
    }
}
struct RouteMap_Previews: PreviewProvider {
  static var previews: some View {
    
      RouteMap()
  }
}

