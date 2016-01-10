//
//  Created by Eduard Panasiuk on 1/4/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public extension NSDate {
    
    /**
     Returns future date with specific hours, minutes
     
     - parameter time: time representation
     - returns: NSDate instance
     */
    public static func futureDateWithHours(time:TimeOfDay) -> NSDate{
        return NSDate().startOfDay().dateByAddingTimeInterval(time.timeInterval)
    }
    
    private func startOfDay() -> NSDate{
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(([NSCalendarUnit.Hour, NSCalendarUnit.Minute]), fromDate: self)
        dateComponents.second = 0
        dateComponents.minute = 0
        dateComponents.hour = 0
        return dateComponents.date ?? self
    }
}