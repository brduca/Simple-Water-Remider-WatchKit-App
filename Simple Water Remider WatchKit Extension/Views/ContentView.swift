//
//  ContentView.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI

struct ContentView: View
{    
    @State private var selectedAmount:Float = 2000.0
    @State private var selectedFrequency = 2
    @State private var selectedHourStart = 7
    @State private var selectedMinStart = 30
    @State private var selectedHourEnd = 23
    @State private var selectedMinEnd = 0
    @State private var pushActive = false
    @State private var plan: [Schedule] = []
    
    private let notificationService: NotificationsServiceProtocol
    private let plannerService: PlannerServiceProtocol
    private let applicationSettings: ApplicationSettingsProtocol
        
    init(notificationService: NotificationsServiceProtocol,
         plannerService: PlannerServiceProtocol,
         applicationSettings: ApplicationSettingsProtocol)
    {
        self.notificationService = notificationService
        self.plannerService = plannerService
        self.applicationSettings = applicationSettings
        
        notificationService.requestAuthorization()
        notificationService.cancelNotifications()
    }
    
    var body: some View {
        Form {
            Section {
                
                VStack {
                    Text("[Amount (ml)]")
                    Slider(value: $selectedAmount, in: applicationSettings.minimumAmount...applicationSettings.maximumAmount, step: Float(500.0))
                    Text("\(Int(selectedAmount.rounded()))")
                }
            }
            
            Section {
                
                VStack {
                    Text("[Frequency]")
                    Picker(selection: $selectedFrequency, label: Text("")) {
                        ForEach(0 ..< applicationSettings.frequencies.count) {
                            Text("\(self.applicationSettings.frequencies[$0])h")
                        }
                    }
                }
            }
            
            Section {
                
                VStack  {
                    Text("[Starting at]")
                    HStack {
                        Picker(selection: $selectedHourStart, label: Text("")) {
                            ForEach(0..<23) {
                                Text("\($0)h")
                            }
                        }
                        Picker(selection: $selectedMinStart, label: Text("")) {
                            ForEach(0..<60) {
                                Text("\($0)m")
                            }
                        }
                    }
                }
            }
            
            Section {
                
                VStack  {
                    Text("[Ending at]")
                    HStack {
                        Picker(selection: $selectedHourEnd, label: Text("")) {
                            ForEach(0..<23) {
                                Text("\($0)h")
                            }
                        }
                        Picker(selection: $selectedMinEnd, label: Text("")) {
                            ForEach(0..<60) {
                                Text("\($0)m")
                            }
                        }
                    }
                }
            }
            
            Section {
               
                Button(action: {
                    
                    self.plan = self.createNotifications()
                    self.pushActive = true
                    
                }) { Text("[Remind me!]") }
                
                NavigationLink(destination: ConfirmationView(plan: self.plan), isActive: $pushActive) { Text("") }.hidden()
            }
        }
    }
    
    private func createNotifications() -> [Schedule]
    {
        return plannerService.buildPlan(totalAmountInMl: selectedAmount,
                                        startHour: selectedHourStart,
                                        startMinute: selectedMinStart,
                                        endHour: selectedHourEnd,
                                        endMinute: selectedMinEnd,
                                        intervalInMinutes: applicationSettings.frequencies[selectedFrequency]*60)
        
        // notificationService.schedule(plan)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView(notificationService: NotificationsService(),
                    plannerService: PlannerService(),
                    applicationSettings: ApplicationSettings.shared)
    }
}
