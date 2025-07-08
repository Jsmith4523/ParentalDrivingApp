//
//  AddPersonAsDriverView.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/8/25.
//

import SwiftUI

struct AddPersonAsDriverView: View {
    
    @State private var drivingEventType: [Event.DrivingEventType] = [.beganDriving, .endedDriving, .crashDetected]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        Image(.bruno)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 95, height: 95)
                        VStack(alignment: .center, spacing: 10) {
                            Text("Add Bruno Pearson")
                                .font(.title2.bold())
                            Text("Using Apple Intelligence, Bruno's driving activity will be recorded, and shared with you. Select what driving events you would like to see from Bruno.\n\nInformation about Bruno's driving is determined on-device and from vehicles that support CarPlay Ultra.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Section("Select") {
                    ForEach(Event.DrivingEventType.allCases) { type in
                        Button {
                            
                        } label: {
                            driveEventTypeCellView(type)
                        }
                    }
                }
            }
            .navigationTitle(Text("Add Bruno Pearson"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                }
            }
        }
    }
    
    private func driveEventTypeCellView(_ type: Event.DrivingEventType) -> some View {
        HStack {
            Image(systemName: type.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 23, height: 23)
                .foregroundStyle(.red)
                .frame(width: 30, alignment: .leading)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(type.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(uiColor: .label))
                }
                .font(.subheadline)
                Text(type.setupDescription)
                    .font(.caption)
                    .foregroundStyle(Color(uiColor: .label))

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ZStack {
                if drivingEventType.contains(type) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                }
            }
            .frame(width: 35, height: 35, alignment: .trailing)
        }
    }
}

#Preview {
    AddPersonAsDriverView()
}
