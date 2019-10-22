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
        var result:[ScheduleProtocol] = []
        
        let totalTimeSpanInMin = (endHour * 60 + endMinute) - (startHour * 60 - startMinute)
        let numberOfTimes = totalTimeSpanInMin/interval
        let dose = amount/Float(numberOfTimes)
                            
        for i in 0...numberOfTimes
        {
            let schedule = Schedule(amount: dose, hour: startHour, min: startMinute)
            result.append(schedule)
        }
        
        return result
    }
}

protocol PlannerServiceProtocol
{
    func buildPlan(amount: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, interval: Int) -> [ScheduleProtocol]
}
