//
//  MiddleLevelEmployee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class MiddleLevelEmployee: Employee {
    
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName  = firstName
        self.lastName   = lastName
        self.email      = email
    }

    func createTask() -> Task {
        
        return Task()
    }
    
  /*  func createCalendarDate() -> Calendar {
        
        return Calendar()
    }
    */
}
