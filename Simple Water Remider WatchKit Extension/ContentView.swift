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
    private let frequencies = [2, 3, 4, 5]
    
    private let minimumAmount:Float = 1000.0
    private let maximumAmount:Float = 5000.0
    
    @State private var selectedAmount:Float = 2000.0
    @State private var selectedFrequency = 2
    
    @State private var selectedHourStart = 7
    @State private var selectedMinStart = 30

    @State private var selectedHourEnd = 23
    @State private var selectedMinEnd = 0
    
    private let notificationService: NotificationsServiceProtocol
    private let plannerService: PlannerServiceProtocol
    
    init(notificationService: NotificationsServiceProtocol,
         plannerService: PlannerServiceProtocol)
    {
        self.notificationService = notificationService
        self.plannerService = plannerService
        notificationService.requestAuthorization()
    }
    
    var body: some View {
        
        Form {
            Section {
                
                VStack {
                    Text("Amount (ml)")
                    Slider(value: $selectedAmount, in: minimumAmount...maximumAmount)
                    Text("\(Int(selectedAmount.rounded()))")
                }
            }

            Section {

                VStack {
                    Text("Frequency")
                    Picker(selection: $selectedFrequency, label: Text(""))
                    {
                        ForEach(0 ..< frequencies.count)
                        {
                            Text("\(self.frequencies[$0])h")
                        }
                    }
                }
            }
            
            Section {
                
                VStack  {
                    
                    Text("Starting at")
                    
                    HStack {
                        
                        Picker(selection: $selectedHourStart, label: Text(""))
                        {
                            ForEach(1 ..< 24)
                            {
                                Text("\($0)h")
                            }
                        }
                        
                        Picker(selection: $selectedMinStart, label: Text(""))
                        {
                            ForEach(0 ..< 60)
                            {
                                Text("\($0)m")
                            }
                        }
                    }
                }
            }
            
            Section {
                           
                           VStack  {
                               
                               Text("Ending at")
                               
                               HStack {
                                   
                                   Picker(selection: $selectedHourEnd, label: Text(""))
                                   {
                                       ForEach(1 ..< 24)
                                       {
                                           Text("\($0)h")
                                       }
                                   }
                                   
                                   Picker(selection: $selectedMinEnd, label: Text(""))
                                   {
                                       ForEach(0 ..< 60)
                                       {
                                           Text("\($0)m")
                                       }
                                   }
                               }
                           }
                       }
            
            Section {
                
                Button(action:
                {
                    self.createNotifications()
                    
                }) {
                    Text("[Remind me!]")
                }
            }
        }
    }
    
    private func createNotifications()
    {
        let plan = plannerService.buildPlan(amount: selectedAmount,
                                            startHour: selectedHourStart,
                                            startMinute: selectedMinStart,
                                            endHour: selectedHourEnd,
                                            endMinute: selectedMinEnd,
                                            interval: selectedFrequency)
        
        notificationService.schedule(plan)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView(notificationService: NotificationsService(),
                    plannerService: PlannerService())
    }
}
