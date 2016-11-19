//
//  Employee.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

protocol Employee {
    
    var firstName   : String { get }
    var lastName    : String { get }
    var fullName    : String { get }
    var email       : String { get }
    var id          : Int    { get }
    
    func sendMessage(to: Employee, subject: String, message: String, date: Date)
    
}

struct employeeID {
    static var id = 0
}
