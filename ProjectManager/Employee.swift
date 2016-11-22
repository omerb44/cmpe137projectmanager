//
//  Employee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

protocol Employee {
    
    var firstName           : String { get }
    var lastName            : String { get }
    var fullName            : String { get }
    var email               : String { get }
    var id                  : Int    { get }
    var sentMessages        : [Message] { get }
    var receivedMessages    : [Message] { get }
    var archivedMessages    : [Message] { get }
    var trashMessages       : [Message] { get }
    var calendar            : Calendar { get }
    var actualProjects      : [Project] { get }
    var recentProjects      : [Project] { get }
    
    func sendMessage(to: Employee, subject: String, message: String, date: Date)
    
}

struct employeeID {
    static var id = 0
}
