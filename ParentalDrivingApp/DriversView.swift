//
//  DriversView.swift
//  ParentalDrivingApp
//
//  Created by Jaylen Smith on 7/7/25.
//

import SwiftUI

struct DriversView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    ScrollView {
                        VStack(spacing: 30) {
                            summary
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "person.3.fill")
                                    Text("Your Drivers")
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.red)
                                            .font(.system(size: 20))
                                    }
                                }
                                .font(.system(size: 16).weight(.medium))
                                .foregroundStyle(.gray)
                                .padding(.horizontal)
                                VStack {
                                    ForEach([Person.bruno, .amanda]) { person in
                                        NavigationLink {
                                            PersonDetailView(person: person)
                                        } label: {
                                            personCellView(person)
                                        }
                                    }
                                }
                            }
                            learningOptionsSection
                        }
                        .padding(.top)
                    }
                    .background(Color(uiColor: .secondarySystemBackground))
                    .navigationTitle(Text("Hey, Maria"))
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                
                            } label: {
                                Image(systemName: "sos")
                            }
                        }
                    }
                    .navigationDestination(for: Person.self) { person in
                        PersonDetailView(person: person)
                    }
                }
            }
            Tab("Stats", systemImage: "chart.bar.fill") {
                
            }
            Tab("Notifications", systemImage: "bell") {
                
            }
            Tab("Me", systemImage: "person") {
                
            }
        }
        .tint(.red)
        .sheet(isPresented: .constant(true)) {
            AddPersonAsDriverView()
        }
    }
    
    private var summary: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "apple.intelligence")
                Text("This week's summary")
            }
            .font(.system(size: 16).weight(.medium))
            .foregroundStyle(.gray)
            HStack(alignment: .top) {
                Text("You've been on a roll this week! Your past drives shows you maintaining proper speed, control, and attention while driving. Keep it up!")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.subheadline)
            .foregroundStyle(.gray)
            .padding()
            .background(Color(uiColor: .systemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray.tertiary)
            })
        }
        .padding(.horizontal)
    }
    
    private var learningOptionsSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "book.fill")
                Text("Recommended Courses")
                Spacer()
            }
            .font(.system(size: 16).weight(.medium))
            .foregroundStyle(.gray)
            LazyVGrid(columns: [.init(), .init()]) {
                ForEach(LearningOption.allCases) { option in
                    learningOptionCell(option)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    private func learningOptionCell(_ option: LearningOption) -> some View {
        VStack(spacing: 20) {
            Image(systemName: option.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(.red)
                .padding(.top, 10)
            VStack(spacing: 10) {
                Text(option.title)
                    .font(.subheadline.weight(.medium))
                Text(option.description)
                    .font(.caption)
                    .lineLimit(5)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
        .clipShape(.rect(cornerRadius: 15))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray.tertiary)
        })
    }
    
    @ViewBuilder
    private func personCellView(_ person: Person) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 13) {
                HStack {
                    person.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    HStack {
                        Text(person.name)
                    }
                    .font(.headline)
                    Spacer()
                    Image(systemName: "info.circle")
                        .font(.system(size: 17))
                        .foregroundStyle(.gray)
                }
                HStack(alignment: .top) {
                    Image(systemName: "apple.intelligence")
                    Text(person.appleIntelligenceSummary)
                }
                .font(.subheadline)
                .foregroundStyle(.gray)
                .lineLimit(3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .multilineTextAlignment(.leading)
        .padding()
        .background(Color(uiColor: .systemBackground))
        .clipShape(.rect(cornerRadius: 20))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.tertiary)
        })
        .padding(.horizontal)
    }
    
    
    
    enum LearningOption: CaseIterable, Identifiable {
        case defensiveDriving
        case crashDetection
        case carplay
        case whenYouNeedHelp
        
        var id: Self { self }
        
        var title: String {
            switch self {
            case .defensiveDriving:
                return "Staying Defensive on the Road"
            case .crashDetection:
                return "Meet Crash Detection"
            case .carplay:
                return "CarPlay"
            case .whenYouNeedHelp:
                return "When You Need Help"
            }
        }
        
        var iconName: String {
            switch self {
            case .defensiveDriving:
                return "steeringwheel"
            case .crashDetection:
                return "iphone.gen3"
            case .carplay:
                return "inset.filled.rectangle.and.person.filled"
            case .whenYouNeedHelp:
                return "car.side.front.open"
            }
        }
        
        var description: String {
            switch self {
            case .defensiveDriving:
                return "Learn how to drive safely by practicing defensive driving techniques."
            case .crashDetection:
                return "Built for iPhone and Apple Watch, crash detection is here to help you stay safe and informative with Emergency Contacts and personnel."
            case .whenYouNeedHelp:
                return "Learn what to do and who to contact when you need assistance on the road."
            case .carplay:
                return "Learn how CarPlay helps you stay connected and safe while driving."
            }
        }
    }
}

#Preview {
    DriversView()
}
