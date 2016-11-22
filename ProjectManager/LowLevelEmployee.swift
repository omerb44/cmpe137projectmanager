//
//  LowLevelEmployee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class LowLevelEmployee: Employee, Hashable {

    var id                  : Int
    var firstName           : String
    var lastName            : String
    var email               : String
    var fullName            : String
    var tasks               = [Task]()
    var sentMessages        = [Message]()
    var receivedMessages    = [Message]()
    var archivedMessages    = [Message]()
    var trashMessages       = [Message]()
    var calendar            : Calendar
    
    var hashValue: Int {
        return self.id
    }
    
    static func ==(lhs: LowLevelEmployee, rhs: LowLevelEmployee) -> Bool {
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
        self.calendar   = Calendar()
    }
    
    func addTask(task: Task) {
        self.tasks.append(task)
    }
    
    func sendMessage(toID: Int, subject: String, message: String, date: Date) {
        let message = Message(senderID: self.id, toID: toID, subject: subject, message: message, date: date, isRead: false)
        sentMessages.append(message)
    }

}
