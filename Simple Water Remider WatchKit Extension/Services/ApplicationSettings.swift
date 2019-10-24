//
//  ApplicationSettings.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Salvador Mósca on 24/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

class ApplicationSettings: ApplicationSettingsProtocol
{
    static let shared = ApplicationSettings()
    private init() { }
    
    let frequencies = [2, 3, 4, 5]
    let minimumAmount:Float = 1000.0
    let maximumAmount:Float = 5000.0
    let stepSize:Float = 500.0
}

protocol ApplicationSettingsProtocol
{
    var frequencies: [Int] { get }
    var minimumAmount:Float { get }
    var maximumAmount:Float { get }
    var stepSize:Float { get }
}
