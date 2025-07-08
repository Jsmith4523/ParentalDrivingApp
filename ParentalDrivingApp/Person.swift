//
//  Person.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/6/25.
//

import Foundation
import SwiftUI
import MapKit

struct Person: Identifiable, Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
    
	var id = UUID()
	let name: String
    let vehicle: String
	let age: Int
    let appleIntelligenceSummary: String
    let sessions: [DriveSession]
    
    var image: Image {
        switch name {
        case "Bruno Pearson":
            return Image(.bruno)
        case "Amanda Person":
            return Image(.amanda)
        default:
            return Image(uiImage: .checkmark)
        }
    }
    
        //.init(latitude: 38.00250, longitude: -122.30107)
    //.init(latitude: 37.96848, longitude: -122.28752)
	
    static let bruno: Person  = .init(name: "Bruno Pearson", vehicle: "2019 Hyundai Kona", age: 19, appleIntelligenceSummary: "Bruno has improved his overall driving skills over the past few months. His most recent drives shows Bruno to be cautious of speed.", sessions: [
        .init(title: "Morning Drive To School", startDate: .now.addingTimeInterval(TimeInterval(86400 * 3)), startLocationEvent: .init(latitude: 38.00250, longitude: -122.30107, description: "Bruno began driving", date: .now, eventType: .beganDriving), endLocationEvent: .init(latitude: 37.96848, longitude: -122.28752, description: "Bruno ended driving", date: .now.addingTimeInterval(TimeInterval(60 * 17)), eventType: .endedDriving), miles: "6 miles", duration: "17 minutes", appleIntelligenceSummary: "Bruno began driving to school around 9:41AM this morning. Speed range between 15-30 MPH"),
        
            .init(title: "Afternoon Drive To AMF", startDate: .now.addingTimeInterval(TimeInterval(3600 * 5)), startLocationEvent: .init(latitude: 37.96848, longitude: -122.28752, description: "Bruno began driving", date: .now.addingTimeInterval(TimeInterval(3600 * 5)), eventType: .beganDriving), endLocationEvent: .init(latitude: 37.99726, longitude: -122.2876, description: "Bruno ended driving", date: .now.addingTimeInterval(TimeInterval(3600 * 5 + 600)), eventType: .endedDriving), miles: "5 miles", duration: "10 minutes", appleIntelligenceSummary: "", events: [
                .init(latitude: 37.98403, longitude: -122.29716, description: "Bruno's speed was 15 above the 45 MPH speed limit on Appian Way", date: .now.addingTimeInterval(TimeInterval(3600 * 5 + 180)), eventType: .speeding)
            ])
    ])
    static let amanda: Person = .init(name: "Amanda Person", vehicle: "2023 Toyota Camry", age: 21, appleIntelligenceSummary: "Amanda's driving suggests improvements within certain areas. Based upon past drives, is recommended that she decreases her speed on highway 280, and improve brake reaction time within traffic.", sessions: [
        
    ])
}
