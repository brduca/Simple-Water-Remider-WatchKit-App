//
//  PlannerService.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

class PlannerService: PlannerServiceProtocol
{
    func buildPlan(amount: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, interval: Int) -> [ScheduleProtocol]
    {
        
        
        return []
    }
}

protocol PlannerServiceProtocol
{
    func buildPlan(amount: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, interval: Int) -> [ScheduleProtocol]
}
