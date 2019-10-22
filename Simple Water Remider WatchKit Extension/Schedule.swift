//
//  Schedule.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 22/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

struct Schedule: ScheduleProtocol
{
    var amount: Float
    var hour: Int
    var min: Int
}

protocol ScheduleProtocol
{
    var amount: Float { get set }
    var hour: Int { get set }
    var min: Int { get set }
}
