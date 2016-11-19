//
//  MiddleLevelEmployee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class MiddleLevelEmployee: Employee {
    
    var id          : Int
    var firstName   : String
    var lastName    : String
    var email       : String
    var fullName    : String
    
    var hashValue: Int {
        return self.id
    }
    
    static func ==(lhs: MiddleLevelEmployee, rhs: MiddleLevelEmployee) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(firstName: String, lastName: String, email: String) {
        self.id         = 0
        self.id         = employeeID.id + 1
        employeeID.id  += 1
        self.firstName  = firstName
        self.lastName   = lastName
        self.email      = email
        self.fullName   = firstName + " " + lastName
    }

    func createTask(description: String, workingEmployees: [LowLevelEmployee], deadLine: Date) -> Task {
        return Task(description: description, workingEmployees: workingEmployees, deadLine: deadLine)
    }
    
    func sendMessage(to: Employee, subject: String, message: String, date: Date) {
        let message = Message(sender: self, to: to, subject: subject, message: message, date: date, isRead: false)
        
    }
    
  /*  func createCalendarDate() -> Calendar {
        
        return Calendar()
    }
    */
}
