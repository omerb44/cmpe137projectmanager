//
//  CalendarDate.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 13.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class CalendarDate {
    var titel   : String
    var place   : String
    var date    : Date
    
    init(titel: String, place: String, date: Date) {
        self.titel  = titel
        self.place  = place
        self.date   = date
    }
    
}
