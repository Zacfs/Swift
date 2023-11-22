import SwiftUI
import MapKit
import CoreLocation
struct MapView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  
  @Binding var directions: [String]
  
  let coordinates: [CLLocationCoordinate2D]
  @Binding var userLocation: CLLocationCoordinate2D
    @State var locationManager = CLLocationManager()
  
  func makeCoordinator() -> MapViewCoordinator {
    return MapViewCoordinator()
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
