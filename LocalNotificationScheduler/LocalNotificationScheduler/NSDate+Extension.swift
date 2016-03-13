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
    public func futureDateWithTime(time:TimeOfDay) -> NSDate{
        let startOfDay = NSCalendar.currentCalendar().startOfDayForDate(self)
        var result = startOfDay.dateByAddingTimeInterval(time.timeInterval)
        if(result.compare(self) == NSComparisonResult.OrderedAscending){
            result = result.dateByAddingTimeInterval(TimeOfDay.oneDayTimeInterval)
        }
        return result
    }
    
    /**
     Returns future date with specific hours, minutes and weekday
     
     - parameter time: time representation
     - returns: NSDate instance
     */
    public func futureDateWithTime(time:TimeOfDay, weekday:WeekDays) -> NSDate{
        let startOfDay = NSCalendar.currentCalendar().startOfDayForDate(self)
        var result = startOfDay.dateByAddingTimeInterval(time.timeInterval)
        if(result.compare(self) == NSComparisonResult.OrderedAscending){
            result = result.dateByAddingTimeInterval(TimeOfDay.oneDayTimeInterval)
        }
        return result
    }
}