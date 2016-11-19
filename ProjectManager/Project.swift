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
    var developmentTeamNames: [LowLevelEmployee]
    var finishedPercentage  : Double
    var milestones          : [Date: String]
    var tasks               : [[LowLevelEmployee: Task]]
    
    init(projectName: String, projectManager: MiddleLevelEmployee, startDate: Date, deadLine: Date,
         developmentTeamNames: [LowLevelEmployee], milestones: [Date: String], tasks: [[LowLevelEmployee: Task]]) {
        self.projectName            = projectName
        self.projectManager         = projectManager
        self.startDate              = startDate
        self.deadLine               = deadLine
        self.developmentTeamNames   = developmentTeamNames
        self.finishedPercentage     = 0.0
        self.milestones             = milestones
        self.tasks                  = tasks
    }
    
}
