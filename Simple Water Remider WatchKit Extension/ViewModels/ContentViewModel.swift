//
//  ContentViewModel.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 24/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject, ContentViewModelProtocol
{
    private let plannerService: PlannerServiceProtocol
    let applicationSettings: ApplicationSettingsProtocol
    
    @Published var selectedAmount:Float = 2000.0
    @Published var selectedFrequency = 2
    @Published var selectedHourStart = 7
    @Published var selectedMinStart = 30
    @Published var selectedHourEnd = 23
    @Published var selectedMinEnd = 0
    @Published var plan: [Schedule] = []
    
    init(notificationService: NotificationsServiceProtocol,
         plannerService: PlannerServiceProtocol,
         applicationSettings: ApplicationSettingsProtocol)
    {
        self.plannerService = plannerService
        self.applicationSettings = applicationSettings
        
        notificationService.requestAuthorization()
    }
    
    func createNotifications()
    {
        self.plan = plannerService.buildPlan(totalAmountInMl: selectedAmount,
                                             startHour: selectedHourStart,
                                             startMinute: selectedMinStart,
                                             endHour: selectedHourEnd,
                                             endMinute: selectedMinEnd,
                                             intervalInMinutes: applicationSettings.frequencies[selectedFrequency]*60)
    }
}

protocol ContentViewModelProtocol
{

}
