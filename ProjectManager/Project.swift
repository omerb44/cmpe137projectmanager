//
//  Project.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Project {
    var projectName         : String
    var projectManager      : MiddleLevelEmployee
    var startDate           : Date
    var deadLine            : Date
    var developmentTeam     : [LowLevelEmployee]
    var finishedPercentage  : Double
    var tasks               : [Task]
    
    init(projectName: String, projectManager: MiddleLevelEmployee, startDate: Date, deadLine: Date,
         developmentTeam: [LowLevelEmployee], tasks: [Task]) {
        self.projectName            = projectName
        self.projectManager         = projectManager
        self.startDate              = startDate
        self.deadLine               = deadLine
        self.developmentTeam        = developmentTeam
        self.finishedPercentage     = 0.0
        self.tasks                  = tasks
    }
    
}
