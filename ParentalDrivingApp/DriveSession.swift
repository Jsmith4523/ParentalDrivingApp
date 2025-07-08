//
//  DriveSession.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/7/25.
//

import Foundation
import MapKit

struct DriveSession: Identifiable, Hashable {
    var id = UUID()
    let title: String
    let startDate: Date
    let startLocationEvent: Event
    let endLocationEvent: Event
    let miles: String
    let duration: String
    let appleIntelligenceSummary: String
    var events = [Event]()
    
    var allEvents: [Event] {
        var currentEvents = events
        currentEvents.append(startLocationEvent)
        currentEvents.append(endLocationEvent)
        return currentEvents.sorted(by: {$0.date < $1.date})
    }
    
    func mapRect() -> MKMapRect {
        let point1 = MKMapPoint(startLocationEvent.coordinate)
        let point2 = MKMapPoint(endLocationEvent.coordinate)
        
        var rect = MKMapRect(x: min(point1.x, point2.x),
                             y: min(point1.y, point2.y),
                             width: abs(point1.x - point2.x),
                             height: abs(point1.y - point2.y))
        
        let padding: Double = 10000
        rect = rect.insetBy(dx: -padding, dy: -padding)
        
        return rect
    }
}

extension Array where Element == Event {
    func mapRect() -> MKMapRect {
        guard !isEmpty else { return .null }

        var rect = MKMapRect.null

        for event in self {
            let point = MKMapPoint(event.coordinate)
            let pointRect = MKMapRect(origin: point, size: MKMapSize(width: 0, height: 0))
            rect = rect.union(pointRect)
        }

        // Optional: Add padding
        let padding: Double = 10000
        return rect.insetBy(dx: -padding, dy: -padding)
    }
}
