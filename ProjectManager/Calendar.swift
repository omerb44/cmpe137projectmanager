//
//  Calendar.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Calendar {
    var dates = [CalendarDate]()
    
    func toAnyObject() -> Any {
        var allCalendar = [Any]()
        for date in dates {
            allCalendar.append(date.toAnyObject())
        }
        if allCalendar.isEmpty {
            allCalendar.append("null" as Any)
        }
        return allCalendar
    }
    
}
