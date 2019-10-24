//
//  ScheduleRow.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 24/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import SwiftUI

struct ScheduleRow: View
{
    var schedule: Schedule
    
    var body: some View
    {
        Text("[\(Int(schedule.amount.rounded()))ml at \(schedule.hours):\(schedule.minutes)]")
    }
}
