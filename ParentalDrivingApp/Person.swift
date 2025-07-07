//
//  Person.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/6/25.
//

import Foundation

struct Person: Identifiable {
	var id = UUID()
	let name: String
	let age: Int
	
	static let bruno: Person  = .init(name: "Bruno", age: 17)
	static let amanda: Person = .init(name: "Amanda", age: 17)
}
