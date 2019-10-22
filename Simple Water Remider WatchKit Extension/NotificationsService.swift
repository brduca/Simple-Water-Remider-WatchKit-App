//
//  NotificationsService.swift
//  Simple Water Remider WatchKit Extension
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 homeland. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationsService: NotificationsServiceProtocol
{
    func schedule(_ fromSchedules: [ScheduleProtocol])
    {
        fromSchedules.forEach { (schedule) in
            
            create(title: "[Drink water]",
                   body: "[Drink \(schedule.amount) amount now!!!]",
                   hour: schedule.hour,
                   minute: schedule.min).schedule()
        }
    }
    
    private func create(title:String, body: String, hour: Int, minute: Int) -> UNNotificationRequest
    {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour:hour, minute: minute), repeats: true)
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        return request
    }
    
    func requestAuthorization()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            
            if granted
            {
                print("Granted")
            }
            else
            {
                print("Deny")
            }
        }
    }
}

extension UNNotificationRequest
{
    func schedule()
    {
        UNUserNotificationCenter.current().add(self) { (error : Error?) in
            guard error != nil  else { return }
        }
    }
}

protocol NotificationsServiceProtocol
{
    func schedule(_ fromSchedule: [ScheduleProtocol])
    func requestAuthorization()
}

