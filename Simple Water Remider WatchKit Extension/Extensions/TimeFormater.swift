//
//  TimeFormater.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 24/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

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
