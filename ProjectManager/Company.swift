//
//  Company.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Company {
    var topLevelEmployees       = [TopLevelEmployee]()
    var middleLevelEmployees    = [MiddleLevelEmployee]()
    var lowLevelEmployees       = [LowLevelEmployee]()
    var allEmployees            = [Employee]()
    var name                    : String
    var employeeCount           : Int
    var accessCodes             = [String]()
    var actualProjects          = [Project]()
    var closedProjects          = [Project]()
    
    init(name: String, employeeCount: Int) {
        self.name           = name
        self.employeeCount  = employeeCount
        createAccessCodes()
    }
    
    func addEmployee(_ employee: Employee) {
        allEmployees.append(employee)
    }
    
    func removeEmployee(employeeFullName: String) {
        for i in 0...allEmployees.count {
            if allEmployees[i].fullName == employeeFullName {
                allEmployees.remove(at: i)
            }
        }
    }
    
    func removeEmployee(employeeId: Int) {
        for i in 0...allEmployees.count {
            if allEmployees[i].id == employeeId {
                allEmployees.remove(at: i)
            }
        }
    }
    
    private func createAccessCodes() {
        var accessCode: String
        for _ in  0...employeeCount {
            accessCode = String.random()
            accessCodes.append(accessCode)
        }
    }
    
    private func toAnyObject(anyEmployee: [Employee]) -> Any {
        var allEmployee = [Any]()
        for employee in anyEmployee {
            allEmployee.append(employee.toAnyObject())
        }
        return allEmployee
    }
    
    private func toAnyObject(projects: [Project]) -> Any {
        var allProjects = [Any]()
        for project in projects {
            allProjects.append(project.toAnyObject())
        }
        return allProjects
    }
    
    func toAnyObject() -> Any {
        return [
            "name" : self.name,
            "employeeCount" : self.employeeCount,
            "topLevelEmployees" : self.toAnyObject(anyEmployee: self.topLevelEmployees),
            "middleLevelEmployees" : self.toAnyObject(anyEmployee: self.middleLevelEmployees),
            "lowLevelEmployees" : self.toAnyObject(anyEmployee: self.lowLevelEmployees),
            "accessCodes" : self.accessCodes,
            "actualProjects" : self.toAnyObject(projects: self.actualProjects),
            "closedProjects" : self.toAnyObject(projects: self.closedProjects)
        ]
    }
    
    
}
