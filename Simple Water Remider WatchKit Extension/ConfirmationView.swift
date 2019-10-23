//
//  ConfirmationView.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI

struct ConfirmationView:View
{
    var plan: [Schedule]
    
    init(plan: [Schedule])
    {
        self.plan = plan
    }
    
    var body: some View
    {
        return List(plan) { schedule  in
            
            ScheduleRow(schedule: schedule)
        }
    }
}

struct ScheduleRow: View
{
    var schedule: Schedule
    
    var body: some View
    {
        Text("Drink \(schedule.amount) at \(schedule.hours):\(schedule.minutes)")
    }
}
