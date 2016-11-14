//
//  Company.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 02.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import Foundation

class Company {
    private var employees = [Employee]()
    var name        : String
    var accessCodes = [String]()
    
    init(name: String) {
        self.name        = name
        self.accessCodes = createAccessCodes()
    }
    
    func addEmployee(employee: Employee) {
        employees.append(employee)
    }
    
    func removeEmployee(employee: Employee) {
        
    }
    
    func createAccessCodes() -> [String] {
        
        return [String]()
    }
}
