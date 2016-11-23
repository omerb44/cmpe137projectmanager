//
//  Task.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Task {
    var description         : String
    var workingEmployee     : LowLevelEmployee
    var deadLine            : Date
    var isAccepted          = false
    
    init(description: String, workingEmployee: LowLevelEmployee, deadLine: Date) {
        self.description        = description
        self.workingEmployee    = workingEmployee
        self.deadLine           = deadLine
    }
    
    func toAnyObject() -> Any {
        return [
            "description"       : self.description,
            "workingEmployee"   : self.workingEmployee.toAnyObject(),
            "deadLine"          : self.deadLine.description,
            "isAccepted"        : self.isAccepted
        ]
    }
    
}
