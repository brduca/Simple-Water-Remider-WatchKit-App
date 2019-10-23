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
        
        let initialTime  = startHour.toMinutes() + startMinute
        let finalTime = endHour.toMinutes() + endMinute
        let totalTimeSpanInMin = finalTime - initialTime
        let numberOfTimes = totalTimeSpanInMin/intervalInMinutes
        let amount = totalAmountInMl/Float(numberOfTimes)
                            
        for i in 0...numberOfTimes
        {
            let time = initialTime + (intervalInMinutes * i)
            let schedule = Schedule(amount: amount, hour: time.inHours(), min: time.inMintutes())
            result.append(schedule)
        }
        
        return result
    }
}

extension Int
{
    func inHours() -> Int
    {
        return Int(self/60)
    }
    
    func inMintutes() -> Int
    {
        return self % 60
    }
    
    func toMinutes() -> Int
    {
        return self*60
    }
}

protocol PlannerServiceProtocol
{
    func buildPlan(totalAmountInMl: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalInMinutes: Int) -> [ScheduleProtocol]
}
