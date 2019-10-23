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
    func buildPlan(totalAmountInMl: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalInMinutes: Int) -> [ScheduleProtocol]
    {
        var result:[ScheduleProtocol] = []
        
        let totalTimeSpanInMin = (endHour * 60 + endMinute) - (startHour * 60 - startMinute)
        let numberOfTimes = totalTimeSpanInMin/intervalInMinutes
        let amount = totalAmountInMl/Float(numberOfTimes)
                            
        for i in 0...numberOfTimes
        {
            let schedule = Schedule(amount: amount, hour: startHour, min: startMinute)
            result.append(schedule)
        }
        
        return result
    }
}

protocol PlannerServiceProtocol
{
    func buildPlan(totalAmountInMl: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalInMinutes: Int) -> [ScheduleProtocol]
}
