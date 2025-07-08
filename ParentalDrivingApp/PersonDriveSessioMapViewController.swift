//
//  PersonDriveSessioMapViewController.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/7/25.
//

import UIKit
import MapKit
import SwiftUI

struct PersonDriveSessioMapViewControllerRepresentable: UIViewControllerRepresentable {
    
    let session: DriveSession
    
    func makeUIViewController(context: Context) -> PersonDriveSessioMapViewController {
        PersonDriveSessioMapViewController(session: session)
    }
    
    func updateUIViewController(_ uiViewController: PersonDriveSessioMapViewController, context: Context) {}
    
    typealias UIViewControllerType = PersonDriveSessioMapViewController
}

class PersonDriveSessioMapViewController: UIViewController, MKMapViewDelegate {
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsTraffic = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layoutMargins.bottom = 150
        mapView.showsUserLocation = true
        mapView.delegate = self
        return mapView
    }()
    
    init(session: DriveSession) {
        super.init(nibName: nil, bundle: .main)
        mapView.setVisibleMapRect(session.mapRect(), animated: false)
        
        let annotations = session.allEvents.map { event in
            EventAnnotation(event: event)
        }
        
        let coordinates = annotations.map(\.coordinate)
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        
        mapView.addAnnotations(annotations)
        mapView.addOverlay(polyline)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        if let polylineOverlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polylineOverlay)
            renderer.strokeColor = .label
            renderer.lineWidth = 3
            return renderer
        }
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        if let eventAnnotation = annotation as? EventAnnotation {
            let annotationView = MKMarkerAnnotationView(annotation: eventAnnotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            annotationView.markerTintColor = eventAnnotation.event.eventType.uiColor
            annotationView.glyphImage = UIImage(systemName: eventAnnotation.event.eventType.icon)
            annotationView.clusteringIdentifier = nil
            return annotationView
        }
        return nil
    }
}

final class EventAnnotation: NSObject, MKAnnotation {
    
    let event: Event
    
    var coordinate: CLLocationCoordinate2D { event.coordinate }
    
    var title: String? { event.eventType.title }
    
    var subtitle: String? { event.date.formatted(date: .omitted, time: .shortened) }
    
    init(event: Event) {
        self.event = event
    }
}

//#Preview {
//    PersonDriveSessioMapViewControllerRepresentable(events: Person.bruno.sessions.first!.events)
//}
