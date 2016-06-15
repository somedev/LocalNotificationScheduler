//
//  Created by Eduard Panasiuk on 1/4/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     Returns future date with specific hours, minutes
     
     - parameter time: time representation
     - returns: NSDate instance
     */
    public func futureDateWithTime(_ time:TimeOfDay) -> Date{
        let startOfDay = Calendar.current().startOfDay(for: self)
        var result = startOfDay.addingTimeInterval(time.timeInterval)
        if(result.compare(self) == ComparisonResult.orderedAscending){
            result = result.addingTimeInterval(TimeOfDay.oneDayTimeInterval)
        }
        return result
    }
    
    /**
     Returns an array of future date with specific hours, minutes and weekday
     
     - parameter time: weekday representation
     - parameter time: time representation
     - returns: NSDate instance
     */
    public func futureDateWithTime(_ time:TimeOfDay, weekDay:WeekDays) -> Date{
        let nextDate = self.futureDateWithTime(time)
        let nextDateDay = nextDate.weekDay()
        var diff = weekDay.rawValue - nextDateDay.rawValue
        if(diff == 0){
            return nextDate
        }
        if(diff < 0){
            diff = 7 + diff
        }
        return nextDate.addingTimeInterval(TimeInterval(diff) * TimeOfDay.oneDayTimeInterval)
    }
}
