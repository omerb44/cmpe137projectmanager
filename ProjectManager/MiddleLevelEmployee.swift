//
//  MiddleLevelEmployee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class MiddleLevelEmployee: Employee {
    
    var id                  : Int
    var firstName           : String
    var lastName            : String
    var type                : String
    var company             : String
    var email               : String
    var userName            : String
    var password            : String
    var fullName            : String
    var sentMessages        = [Message]()
    var receivedMessages    = [Message]()
    var archivedMessages    = [Message]()
    var trashMessages       = [Message]()
    var calendar            : Calendar
    
    var hashValue: Int {
        return self.id
    }
    
    static func ==(lhs: MiddleLevelEmployee, rhs: MiddleLevelEmployee) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(firstName: String, lastName: String, email: String, userName: String, password: String, company: String) {
        self.id         = Int.random()
        self.firstName  = firstName
        self.lastName   = lastName
        self.type       = "MiddleLevelEmployee"
        self.company    = company
        self.userName   = userName
        self.password   = password
        self.email      = email
        self.fullName   = firstName + " " + lastName
        self.calendar   = Calendar()
    }
    
    init() {
        self.id         = 0
        self.firstName  = ""
        self.type       = "MiddleLevelEmployee"
        self.company    = ""
        self.lastName   = ""
        self.userName   = ""
        self.password   = ""
        self.email      = ""
        self.fullName   = firstName + " " + lastName
        self.calendar   = Calendar()
    }
    
    func toAnyObjectArray(messageArray: [Message]) -> Any {
        var anyMessage = [Any]()
        for message in messageArray {
            anyMessage.append(message.toAnyObject())
        }
        if anyMessage.isEmpty {
            anyMessage.append("null" as Any)
        }
        return anyMessage
    }
    
    func toAnyObject() -> Any {
        return [
            "id"            : self.id,
            "company"       : self.company,
            "type"          : self.type,
            "firstName"     : self.firstName,
            "lastName"      : self.lastName,
            "fullName"      : self.fullName,
            "userName"      : self.userName,
            "password"      : self.password,
            "email"         : self.email,
            "sentMail"      : toAnyObjectArray(messageArray: self.sentMessages),
            "receivedMail"  : toAnyObjectArray(messageArray: self.receivedMessages),
            "archivedMail"  : toAnyObjectArray(messageArray: self.archivedMessages),
            "trashMessages" : toAnyObjectArray(messageArray: self.trashMessages),
            "calendar"      : self.calendar.toAnyObject()
        ]
    }

    func createTask(description: String, workingEmployees: LowLevelEmployee, deadLine: Date) -> Task {
        return Task(description: description, workingEmployee: workingEmployees, deadLine: deadLine)
    }
    
    func sendMessage(toID: Int, subject: String, message: String, date: Date) {
        let message = Message(senderID: self.id, toID: toID, subject: subject, message: message, date: date, isRead: false)
        sentMessages.append(message)
    }
    
  /*  func createCalendarDate() -> Calendar {
        
        return Calendar()
    }
    */
}
