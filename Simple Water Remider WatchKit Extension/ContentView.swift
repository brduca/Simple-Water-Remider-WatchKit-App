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
    private let amounts = ["100 ml", "200 ml", "300 ml", "400 ml"]
    private let frequencies = ["2h", "3h", "4h", "5h"]
    
    @State private var selectedAmount = 0
    @State private var selectedFrequency = 0
    @State private var selectedStart = 0
    @State private var selectedEnd = 0
    
    var notificationService: NotificationsServiceProtocol
    
    var body: some View {
        
        Form {
            
            Section {
                
                Picker(selection: $selectedAmount, label: Text("Amount"))
                {
                    ForEach(0 ..< amounts.count)
                    {
                        Text(self.amounts[$0])
                    }
                }
            }
            
            Section {
                
                Picker(selection: $selectedFrequency, label: Text("Frequency"))
                {
                    ForEach(0 ..< frequencies.count)
                    {
                        Text(self.frequencies[$0])
                    }
                }
            }
            
            Section {
                
                HStack  {
                    Picker(selection: $selectedStart, label: Text("Start"))
                    {
                        ForEach(0 ..< frequencies.count)
                        {
                            Text(self.frequencies[$0])
                        }
                    }
                    
                    Picker(selection: $selectedEnd, label: Text("End"))
                    {
                        ForEach(0 ..< frequencies.count)
                        {
                            Text(self.frequencies[$0])
                        }
                    }
                }
            }
            
            Section {
                
                Button(action: {
                    self.createNotifications()
                    
                }) {
                    Text("[Remind me!]")
                }
            }
        }
    }
        
    private func createNotifications()
    {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
