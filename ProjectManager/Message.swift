//
//  Message.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Message {
    var senderID : Int
    var toID     : Int
    var subject  : String
    var message  : String
    var date     : Date
    var isRead   : Bool
    
    init(senderID: Int, toID: Int, subject: String, message: String, date: Date, isRead: Bool) {
        self.senderID   = senderID
        self.toID       = toID
        self.subject    = subject
        self.message    = message
        self.date       = date
        self.isRead     = false
    }
}
