//
//  PersonDriveSessionDetailMapView.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/7/25.
//

import SwiftUI

struct PersonDriveSessionDetailMapView: View {
    
    let person: Person
    let session: DriveSession
    
    var body: some View {
        PersonDriveSessioMapViewControllerRepresentable(session: session)
            .ignoresSafeArea()
            .toolbar(content: {
                ToolbarItem(placement: .title) {
                    HStack(spacing: 5) {
                        
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.headline)
                        }
                    }
                    .frame(height: 45)
                    .padding(.horizontal)
                    .glassEffect(.regular)
                }
            })
            .sheet(isPresented: .constant(true)) {
                eventsListView
            }
    }
    
    var eventsListView: some View {
        NavigationStack(root: {
            List(session.allEvents.sorted(by: {$0.date > $1.date })) { event in
                eventCellView(event)
                    .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Events"))
            .navigationBarTitleDisplayMode(.inline)
            .contentMargins(.top, 0)
        })
        .presentationDetents([.height(200), .medium, .large])
        .presentationDragIndicator(.visible)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
        .presentationBackground(Color(uiColor: .secondarySystemBackground))
        .interactiveDismissDisabled()
    }
    
    private func eventCellView(_ event: Event) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(event.eventType.title)
                    .font(.system(size: 18).weight(.bold))
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.description)
                        .font(.body)
                    Text(event.date.formatted(date: .omitted, time: .shortened))
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                }
            }
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: event.eventType.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .frame(width: 35, height: 35)
                .background(event.eventType.color)
                .clipShape(.circle)
        }
    }
}

#Preview {
    NavigationStack {
        PersonDriveSessionDetailMapView(person: .bruno, session: Person.bruno.sessions.last!)
    }
}
