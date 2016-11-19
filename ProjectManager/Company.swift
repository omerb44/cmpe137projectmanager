//
//  Company.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Company {
    var employees       = [Employee]()
    var name            : String
    var employeeCount   : Int
    var accessCodes     = [String]()
    
    init(name: String, employeeCount: Int) {
        self.name           = name
        self.employeeCount  = employeeCount
        createAccessCodes()
    }
    
    func addEmployee(_ employee: Employee) {
        employees.append(employee)
    }
    
    func removeEmployee(employeeFullName: String) {
        for i in 0...employees.count {
            if employees[i].fullName == employeeFullName {
                employees.remove(at: i)
            }
        }
    }
    
    func removeEmployee(employeeId: Int) {
        for i in 0...employees.count {
            if employees[i].id == employeeId {
                employees.remove(at: i)
            }
        }
    }
    
    func createAccessCodes() {
        var accessCode: String
        for _ in  0...employeeCount {
            accessCode = String.random()
            accessCodes.append(accessCode)
        }
    }
}
