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
        Form {
            
            Section {
                List(plan) { schedule  in
                    ScheduleRow(schedule: schedule)
                }
            }
            
            Section {
                Button(action: {
                    // self.settings.score += 1
                }) {
                    Text("[Schedule]")
                }
            }
        }
    }
}
