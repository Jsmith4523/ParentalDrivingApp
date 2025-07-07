//
//  Event.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/6/25.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
	var id = UUID()
	let latitude: Double
	let longitude: Double
	let description: String
	let eventType: DrivingEventType
	
	enum DrivingEventType {
		case beganDriving
		case endedDriving
		case crashDetected
		case speeding
		case hardBraking
		case hardAcceleration
		case swerving
		case vehicleFlip
		case phoneUse
		
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
