//
// Created by Eduard Panasiuk on 1/3/16.
// Copyright (c) 2016 somedev. All rights reserved.
//

import UIKit

public extension UILocalNotification {
    public static func maxNotificationsCount() -> Int{
        return 64
    }
    
    public static func notificationWithTime(_ time:TimeOfDay) -> UILocalNotification{
        let notification = UILocalNotification()
        notification.fireDate = Date().futureDateWithTime(time)
        return notification
    }
    
    public static func notificationWithTime(_ time:TimeOfDay, weekDay:WeekDays, repeatable:Bool = false) -> UILocalNotification{
        let notification = UILocalNotification()
        notification.fireDate = Date().futureDateWithTime(time, weekDay: weekDay)
        if(repeatable){
            notification.repeatInterval = .weekday
        }
        return notification
    }
}

