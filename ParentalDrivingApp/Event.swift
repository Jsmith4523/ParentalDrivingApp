//
//  Event.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/6/25.
//

import Foundation
import SwiftUI
import MapKit

struct Event: Identifiable, Hashable {
	var id = UUID()
	let latitude: Double
	let longitude: Double
	let description: String
    let date: Date
	let eventType: DrivingEventType
    
    var coordinate: CLLocationCoordinate2D {
        return .init(latitude: latitude, longitude: longitude)
    }
	
    enum DrivingEventType: CaseIterable, Identifiable {
		case beganDriving
		case endedDriving
		case crashDetected
		case speeding
		case hardBraking
		case hardAcceleration
		case swerving
		case vehicleFlip
		case phoneUse
        
        var id: Self { self }
        
        var title: String {
            switch self {
            case .beganDriving:
                return "Start"
            case .endedDriving:
                return "End"
            case .crashDetected:
                return "Crash Detection"
            case .speeding:
                return "Speed"
            case .hardBraking:
                return "Hard Braking"
            case .hardAcceleration:
                return "Hard Acceleration"
            case .swerving:
                return "Swerving"
            case .vehicleFlip:
                return "Roll-over"
            case .phoneUse:
                return "Phone Use"
            }
        }
		
		var color: Color {
			switch self {
			case .beganDriving, .endedDriving:
				return .blue
			case .crashDetected:
				return .red
			case .speeding:
				return .orange
			case .hardBraking:
				return .orange
			case .hardAcceleration:
				return .orange
			case .swerving:
				return .orange
			case .vehicleFlip:
				return .red
			case .phoneUse:
				return .orange
			}
		}
        
        var uiColor: UIColor {
            UIColor(color)
        }
        
        var setupDescription: String {
            switch self {
            case .beganDriving:
                return "When Bruno began driving. This option is always enabled."
            case .endedDriving:
                return "When Bruno ended driving. This option is always enabled."
            case .crashDetected:
                return "As an emergency contact for Bruno, you'll already be notified when Bruno's iPhone detects a crash, as well as when it is logged within a drive."
            case .speeding:
                return "You'll be notified when Bruno's speed has gone 15 mph over the posted speed limit."
            case .hardBraking:
                return "You'll be notified when Bruno's iPhone detects hard braking."
            case .hardAcceleration:
                return "You'll be notified when Bruno's iPhone detects hard acceleration."
            case .swerving:
                return "You'll be notified when Bruno's iPhone detects swerving."
            case .vehicleFlip:
                return "As an emergency contact, Bruno's iPhone or Apple Watch will immediately notify you if a vehicle flip is detected, and will log it within a drive."
            case .phoneUse:
                return "You'll be notified when Bruno's iPhone detects Bruno using their phone while driving outside of navigation and other driving applications."
            }
        }
		
		var icon: String {
			switch self {
			case .beganDriving:
				return "d.circle.fill"
			case .endedDriving:
				return "p.circle.fill"
			case .crashDetected:
				return "car.side.rear.and.collision.and.car.side.front"
			case .speeding:
				return "gauge.with.dots.needle.67percent"
			case .hardBraking:
				return "car.side.rear.and.exclamationmark.and.car.side.front"
			case .hardAcceleration:
				return "pedal.accelerator"
			case .swerving:
				return "car.rear.and.tire.marks"
			case .vehicleFlip:
				return "car.side.and.exclamationmark"
			case .phoneUse:
				return "iphone.badge.exclamationmark"
			}
		}
	}
}
