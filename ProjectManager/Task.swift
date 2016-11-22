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
    var workingEmployees    : LowLevelEmployee
    var deadLine            : Date
    
    init(description: String, workingEmployees: LowLevelEmployee, deadLine: Date) {
        self.description        = description
        self.workingEmployees   = workingEmployees
        self.deadLine           = deadLine
    }
    
}
