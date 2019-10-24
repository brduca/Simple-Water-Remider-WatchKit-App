//
//  ContentView.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Salvador Mósca on 21/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State var pushActive = false
    
    @ObservedObject var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel)
    {
        self.viewModel = viewModel
    }
    
    var body: some View {

        Form {
        
            Section {

                VStack {
                    Text("[Amount (ml)]")
                    Slider(value: $viewModel.selectedAmount,
                           in: viewModel.applicationSettings.minimumAmount...viewModel.applicationSettings.maximumAmount,
                           step: viewModel.applicationSettings.stepSize)
                    Text("\(Int(viewModel.selectedAmount.rounded()))")
                }
            }

            Section {
                
                VStack {
                    Text("[Frequency]")
                    Picker(selection: $viewModel.selectedFrequency, label: Text("")) {
                        ForEach(0 ..< viewModel.applicationSettings.frequencies.count) {
                            Text("\(self.viewModel.applicationSettings.frequencies[$0])h")
                        }
                    }
                }
            }
            
            Section {
                
                VStack  {
                    Text("[Starting at]")
                    HStack {
                        Picker(selection: $viewModel.selectedHourStart, label: Text("")) {
                            ForEach(0..<23) {
                                Text("\($0)h")
                            }
                        }
                        Picker(selection: $viewModel.selectedMinStart, label: Text("")) {
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
                        Picker(selection: $viewModel.selectedHourEnd, label: Text("")) {
                            ForEach(0..<23) {
                                Text("\($0)h")
                            }
                        }
                        Picker(selection: $viewModel.selectedMinEnd, label: Text("")) {
                            ForEach(0..<60) {
                                Text("\($0)m")
                            }
                        }
                    }
                }
            }
            
            Section {
                
                Button(action: {
                    
                    self.viewModel.createNotifications()
                    self.pushActive = true
                    
                }) { Text("[Remind me!]") }
                
                NavigationLink(destination: ConfirmationView(viewModel: ConfirmationViewModel(plan: self.viewModel.plan)), isActive: $pushActive) { Text("") }.hidden()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView(viewModel: ContentViewModel(notificationService: NotificationsService(),
                                                plannerService: PlannerService(),
                                                applicationSettings: ApplicationSettings.shared))
    }
}
