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
    var userName            : String
    var type                : String
    var company             : String
    var password            : String
    var email               : String
    var fullName            : String
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
    
    init(firstName: String, lastName: String, email: String, userName: String, password: String, company: String) {
        self.id         = Int.random()
        self.firstName  = firstName
        self.lastName   = lastName
        self.type       = "LowLevelEmployee"
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
        self.type       = "LowLevelEmployee"
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
    
    func sendMessage(toID: Int, subject: String, message: String, date: Date) {
        let message = Message(senderID: self.id, toID: toID, subject: subject, message: message, date: date, isRead: false)
        sentMessages.append(message)
    }

}
