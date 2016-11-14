//
//  TopLevelEmployee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class TopLevelEmployee: Employee {
    
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName  = firstName
        self.lastName   = lastName
        self.email      = email
    }
   /*
    func registerCompany(companyName: String) -> Company {
        
        
    }
    
 */
    func createTask() -> Task {
        
        return Task()
    }
    
    func createCalendarDate() -> CalendarDate {
        
        return CalendarDate()
    }
    
    func shareCalendarDate(calendarDate: CalendarDate) {
    
    }
    
}
