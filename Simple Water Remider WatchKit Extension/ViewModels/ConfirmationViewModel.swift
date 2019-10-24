//
//  ConfirmationViewModel.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Salvador Mósca on 24/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation

class ConfirmationViewModel:ConfirmationViewModelProtocol
{
    var plan: [Schedule]
    var notificationService: NotificationsServiceProtocol!
    
    init(plan: [Schedule])
    {
        self.plan = plan
    }
    
    func confirm()
    {
        notificationService.schedule(plan)
    }
}

protocol ConfirmationViewModelProtocol
{
    var plan: [Schedule] { get }
    
    func confirm()
}
