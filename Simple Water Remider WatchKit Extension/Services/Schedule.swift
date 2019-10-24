//
//  Schedule.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

class Schedule: ScheduleProtocol
{ 
    var amount: Float
    var hours: Int
    var minutes: Int
    
    init(amount: Float, hours: Int, minutes:Int)
    {
        self.amount = amount
        self.hours = hours
        self.minutes = minutes
    }
}

extension Schedule: Identifiable
{
    var id: ObjectIdentifier { ObjectIdentifier(self) }
}

protocol ScheduleProtocol
{
    var amount: Float { get set }
    var hours: Int { get set }
    var minutes: Int { get set }
}
