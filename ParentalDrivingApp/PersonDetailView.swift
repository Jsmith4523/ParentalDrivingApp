//
//  PersonDetailView.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/7/25.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    
    let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var body: some View {
        NavigationStack {
            List {
                userInfoSection
                appleIntelligenceSummarySection
                drivingHistory
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
    }
    
    private var userInfoSection: some View {
        Section {
            VStack(spacing: 10) {
                person.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                VStack(spacing: 5) {
                    Text(person.name)
                        .font(.title.bold())
                    Text(person.age.description + " years old")
                        .font(.headline)
                    Text(person.vehicle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Text("Commend")
                        .frame(maxWidth: .infinity)
                    .frame(height: 50)
                }
                .glassEffect(.regular)
                Button {
                    
                } label: {
                    Text("Call")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                }
                .glassEffect(.regular)
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
        .listRowSeparator(.hidden, edges: .all)
        .listRowBackground(Color.clear)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var appleIntelligenceSummarySection: some View {
        Section {
            Text(person.appleIntelligenceSummary)
            .font(.system(size: 14))
            .foregroundStyle(.gray)
        } header: {
            HStack {
                Image(systemName: "apple.intelligence")
                Text("Apple Intelligence Summary")
            }
        }
    }
    
    private var drivingHistory: some View {
        Section("Past Drives") {
            ForEach(person.sessions) { session in
                NavigationLink {
                    PersonDriveSessionDetailMapView(person: person, session: session)
                } label: {
                    PersonDetailDriveSessionCellView(session: session)
                }
            }
        }
    }
    
    func personAnnotationView(_ person: Person) -> some View {
        person.image
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .frame(width: 30, height: 30)
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(.circle)
            .shadow(radius: 10)
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 2)
            }
    }
}

struct PersonDetailDriveSessionCellView: View {
    
    let session: DriveSession
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            mapView
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(session.title)
                        .font(.headline)
                        .foregroundStyle(Color(uiColor: .label))
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(session.duration)
                            Divider()
                            Text(session.miles)
                            Divider()
                            Text("\(session.events.count) "+(session.events.count == 1 ? "Event" : "Events"))
                            
                        }
                        .font(.system(size: 14).weight(.medium))
                        .foregroundStyle(.gray)
                        .frame(height: 20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            HStack {
                Image(systemName: "apple.intelligence")
                Text(session.appleIntelligenceSummary)
            }
            .font(.system(size: 13))
            .foregroundStyle(.gray)
        })
        .multilineTextAlignment(.leading)
        .padding(.vertical, 2)
    }
    
    private var mapView: some View {
        Map(
            mapRect: .constant(session.mapRect()),
            annotationItems: [session.startLocationEvent, session.endLocationEvent],
            annotationContent: { event in
                MapMarker(coordinate: event.coordinate)
            }
        )
        .disabled(true)
        .frame(height: 200)
        .clipShape(.rect(cornerRadius: 10))
    }
}

extension CLLocationCoordinate2D: @retroactive Identifiable {
    public var id: Double {
        self.longitude
    }
    
    
}

#Preview {
    PersonDetailView(person: .bruno)
}
