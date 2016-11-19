//
//  Message.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Message {
    var sender  : Employee
    var to      : Employee
    var subject : String
    var message : String
    var date    : Date
    var isRead  : Bool
    
    init(sender: Employee, to: Employee, subject: String, message: String, date: Date, isRead: Bool) {
        self.sender     = sender
        self.to         = to
        self.subject    = subject
        self.message    = message
        self.date       = date
        self.isRead     = false
    }
}
