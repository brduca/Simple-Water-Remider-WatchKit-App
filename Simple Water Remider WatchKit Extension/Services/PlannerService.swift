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
    func buildPlan(totalAmountInMl: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalInMinutes: Int) -> [Schedule]
    {
        var result:[Schedule] = []
        
        let initialTime  = startHour.toMinutes() + startMinute
        let finalTime = endHour.toMinutes() + endMinute
        let totalTimeSpanInMin = finalTime - initialTime
        let numberOfTimes = totalTimeSpanInMin/intervalInMinutes
        let amount = totalAmountInMl/Float(numberOfTimes)
                            
        for i in 0...numberOfTimes
        {
            let time = initialTime + (intervalInMinutes * i)
            let schedule = Schedule(amount: amount, hours: time.inHours(), minutes: time.inMintutes())
            result.append(schedule)
        }
        
        return result
    }
}


protocol PlannerServiceProtocol
{
    func buildPlan(totalAmountInMl: Float, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalInMinutes: Int) -> [Schedule]
}
