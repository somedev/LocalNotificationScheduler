//
// Created by Eduard Panasiuk on 1/3/16.
// Copyright (c) 2016 somedev. All rights reserved.
//

import UIKit

public extension UILocalNotification {
    public static func maxNotificationsCount() -> Int{
        return 64
    }
    
    public static func notificationWithTime(time:TimeOfDay) -> UILocalNotification{
        let notification = UILocalNotification()
        notification.fireDate = NSDate().futureDateWithTime(time)
        return notification
    }
}

