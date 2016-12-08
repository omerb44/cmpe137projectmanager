//
//  ProjectsTasksVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit
import Firebase

class ProjectsTasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var projectsTableView: UITableView!
    @IBOutlet weak var percentFinishedView: UIView!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    var allProjects = AllProjectsArray()
    var recentProjects = AllProjectsArray()
    var allTasks = AllTasksArray()
    
    var lowLevelE = LowLevelEmployee()
    var midLevelE = MiddleLevelEmployee()
    var topLevelE = TopLevelEmployee()
    
    var uID = 0
    var companyName = ""
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(uID)

        self.projectsTableView.layoutSubviews()
        self.projectsTableView.tableFooterView = UIView()

        switch type {
        case "LowLevelEmployee":
            let ref2 = FIRDatabase.database().reference(withPath: companyName)
            let ref3 = ref2.child("lowLevelEmployees")
            ref3.observeSingleEvent(of: .value, with: { snapshot in
                for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    if values.key != "0" {
                        if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                            let firstname = values.childSnapshot(forPath: "firstName").value as! String
                            let lastname = values.childSnapshot(forPath: "lastName").value as! String
                            let email = values.childSnapshot(forPath: "email").value as! String
                            let username = values.childSnapshot(forPath: "userName").value as! String
                            let password = values.childSnapshot(forPath: "password").value as! String
                            let company = self.companyName
                            self.lowLevelE = LowLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                            self.lowLevelE.id = self.uID
                        }
                    }
                }
            })
            plusButton.isEnabled = false
            plusButton.tintColor = UIColor.clear
            break
        case "MiddleLevelEmployee":
            let ref2 = FIRDatabase.database().reference(withPath: companyName)
            let ref3 = ref2.child("middleLevelEmployees")
            ref3.observeSingleEvent(of: .value, with: { snapshot in
                for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                        let firstname = values.childSnapshot(forPath: "firstName").value as! String
                        let lastname = values.childSnapshot(forPath: "lastName").value as! String
                        let email = values.childSnapshot(forPath: "email").value as! String
                        let username = values.childSnapshot(forPath: "userName").value as! String
                        let password = values.childSnapshot(forPath: "password").value as! String
                        let company = self.companyName
                        self.midLevelE = MiddleLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                    }
                }
            })
            break
        case "TopLevelEmployee":
            let ref2 = FIRDatabase.database().reference(withPath: companyName)
            let ref3 = ref2.child("topLevelEmployees")
            ref3.observeSingleEvent(of: .value, with: { snapshot in
                for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                        let firstname = values.childSnapshot(forPath: "firstName").value as! String
                        let lastname = values.childSnapshot(forPath: "lastName").value as! String
                        let email = values.childSnapshot(forPath: "email").value as! String
                        let username = values.childSnapshot(forPath: "userName").value as! String
                        let password = values.childSnapshot(forPath: "password").value as! String
                        let company = self.companyName
                        self.topLevelE = TopLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                        self.topLevelE.id = self.uID
                    }
                }
            })
            break
        default: break
        }
        
        getProjects4()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "My Projects"
        self.projectsTableView.reloadData()
        
        let ref2 = FIRDatabase.database().reference(withPath: companyName)
        let actualProjectsChild = ref2.child("actualProjects")
        for project in allProjects.allProjects {
            let newProject = actualProjectsChild.child(project.projectName)
            newProject.setValue(project.toAnyObject())
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return allProjects.allProjects.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsTableView.dequeueReusableCell(withIdentifier: "testCell")! as! ProjectsCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        if !allProjects.allProjects.isEmpty {
            cell.projectNameLabel.text = allProjects.allProjects[indexPath.row].projectName
            cell.projectManagerNameLabel.text = allProjects.allProjects[indexPath.row].projectManager.fullName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let cancel = UITableViewRowAction(style: .normal, title: "Cancel") { action, index in
            UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
            self.view.makeToast(message: "Project canceled", duration: 0.6, position: HRToastPositionCenter as AnyObject)
            self.recentProjects.allProjects.append(self.allProjects.allProjects[indexPath.row])
            let ref2 = FIRDatabase.database().reference(withPath: self.companyName)
            let actualProjectsChild = ref2.child("closedProjects")
            for project in self.recentProjects.allProjects {
                let newProject = actualProjectsChild.child(project.projectName)
                newProject.setValue(project.toAnyObject())
            }
            let recentsNav = self.tabBarController?.viewControllers?[3] as! UINavigationController
            var recents = RecentsVC()
            recents = recentsNav.viewControllers[0] as! RecentsVC
            recents.allProjects = self.recentProjects
            let oldProjectChild = ref2.child("actualProjects").child(self.allProjects.allProjects[indexPath.row].projectName)
            oldProjectChild.removeValue()
            self.allProjects.allProjects.remove(at: indexPath.row)
            self.projectsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        cancel.backgroundColor = UIColor.red
        
        let finish = UITableViewRowAction(style: .normal, title: "Finished") { action, index in
            UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
            self.view.makeToast(message: "Project finished", duration: 0.6, position: HRToastPositionCenter as AnyObject)
            self.recentProjects.allProjects.append(self.allProjects.allProjects[indexPath.row])
            let ref2 = FIRDatabase.database().reference(withPath: self.companyName)
            let actualProjectsChild = ref2.child("closedProjects")
            for project in self.recentProjects.allProjects {
                let newProject = actualProjectsChild.child(project.projectName)
                newProject.setValue(project.toAnyObject())
            }
            let recentsNav = self.tabBarController?.viewControllers?[3] as! UINavigationController
            var recents = RecentsVC()
            recents = recentsNav.viewControllers[0] as! RecentsVC
            recents.allProjects = self.recentProjects
            let oldProjectChild = ref2.child("actualProjects").child(self.allProjects.allProjects[indexPath.row].projectName)
            oldProjectChild.removeValue()
            self.allProjects.allProjects.remove(at: indexPath.row)
            self.projectsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        finish.backgroundColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6)
        
        return [finish, cancel]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if type == "MiddleLevelEmployee" || type == "TopLevelEmployee" {
            return true
        }
        return false
    }
    
    func getEmployee(id: Int) -> LowLevelEmployee {
        let ref2 = FIRDatabase.database().reference(withPath: companyName)
        let ref3 = ref2.child("lowLevelEmployees")
        var empl = LowLevelEmployee()
        ref3.observeSingleEvent(of: .value, with: { snapshot in
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if values.key != "0" {
                    if id == values.childSnapshot(forPath: "id").value as! Int {
                        let firstname = values.childSnapshot(forPath: "firstName").value as! String
                        let lastname = values.childSnapshot(forPath: "lastName").value as! String
                        let email = values.childSnapshot(forPath: "email").value as! String
                        let username = values.childSnapshot(forPath: "userName").value as! String
                        let password = values.childSnapshot(forPath: "password").value as! String
                        let company = self.companyName
                        empl = LowLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                    }
                }
            }
        })
        return empl
    }
    
    func getEmployee1(id: Int, completion: @escaping (_ empl: MiddleLevelEmployee) -> Void) {
        let ref2 = FIRDatabase.database().reference(withPath: companyName)
        let ref3 = ref2.child("middleLevelEmployees")
        var empl = MiddleLevelEmployee()
        ref3.observeSingleEvent(of: .value, with: { snapshot in
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if id == values.childSnapshot(forPath: "id").value as! Int {
                    let firstname = values.childSnapshot(forPath: "firstName").value as! String
                    let lastname = values.childSnapshot(forPath: "lastName").value as! String
                    let email = values.childSnapshot(forPath: "email").value as! String
                    let username = values.childSnapshot(forPath: "userName").value as! String
                    let password = values.childSnapshot(forPath: "password").value as! String
                    let company = self.companyName
                    empl = MiddleLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                    completion(empl)
                }
            }
        })


    }
    
    func getEmployee(id: Int) -> MiddleLevelEmployee {
        let ref2 = FIRDatabase.database().reference(withPath: companyName)
        let ref3 = ref2.child("middleLevelEmployees")
        var empl = MiddleLevelEmployee()
        ref3.observeSingleEvent(of: .value, with: { snapshot in
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if id == values.childSnapshot(forPath: "id").value as! Int {
                    let firstname = values.childSnapshot(forPath: "firstName").value as! String
                    let lastname = values.childSnapshot(forPath: "lastName").value as! String
                    let email = values.childSnapshot(forPath: "email").value as! String
                    let username = values.childSnapshot(forPath: "userName").value as! String
                    let password = values.childSnapshot(forPath: "password").value as! String
                    let company = self.companyName
                    empl = MiddleLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
                }
            }
        })
        return empl
    }
    
    func getProjects(completion1: @escaping (_ deadLine: String, _ projectName: String, _ projectManagerId: Int) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        
        let ref2 = FIRDatabase.database().reference(withPath: companyName)
        let ref3 = ref2.child("actualProjects")
        ref3.observeSingleEvent(of: .value, with: { snapshot in
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if values.key != "0" {
                    let deadline = values.childSnapshot(forPath: "deadLine").value as! String
                    let projectName = values.childSnapshot(forPath: "projectName").value as! String
                    let projectManager = values.childSnapshot(forPath: "projectManager").childSnapshot(forPath: "id").value as! Int
                    completion1(deadline, projectName, projectManager)
                }
            }
        })
    }
    
    func getProjects2(completion2: @escaping (_ deadLine: String, _ projectName: String, _ projectManagerId2: MiddleLevelEmployee) -> Void) {
        getProjects(completion1: { deadLine, projectName, projectManagerId in
            var projectManager = MiddleLevelEmployee()
            projectManager = self.getEmployee(id: projectManagerId)
            completion2(deadLine, projectName, projectManager)
        })
    }
    
 /*   func getProjects2(completion2: @escaping (_ deadLine: String, _ projectName: String, _ projectManagerId2: MiddleLevelEmployee) -> Void) {
        getProjects(completion1: { deadLine, projectName, projectManagerId in
            self.getEmployee1(id: projectManagerId) { empl in
                completion2(deadLine, projectName, empl)
            }
            
        })
    } */
    
    func getProjects3(completion3: @escaping (_ deadLine: String, _ projectName: String, _ projectManager: MiddleLevelEmployee, _ tasks: [Task])-> Void) {
        getProjects2(completion2: { deadLine, projectName, projectManagerId2 in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
            let ref2 = FIRDatabase.database().reference(withPath: self.companyName)
            let ref3 = ref2.child("actualProjects")
            let ref4 = ref3.child(projectName).child("tasks")
            ref4.observeSingleEvent(of: .value, with: { snapshot1 in
                var tasks = [Task]()
                for values1 in snapshot1.children.allObjects as! [FIRDataSnapshot] {
                    let tDeadline = values1.childSnapshot(forPath: "deadLine").value as! String
                    let description = values1.childSnapshot(forPath: "description").value as! String
                    let workingEmployee = values1.childSnapshot(forPath: "workingEmployee").childSnapshot(forPath: "id").value as! Int
                    let date = dateFormatter.date(from: tDeadline)
                    let task = Task(description: description, workingEmployee: self.getEmployee(id: workingEmployee), deadLine: date!)
                    tasks.append(task)
                }
                completion3(deadLine, projectName, projectManagerId2, tasks)
            })
        })
    }
    
    func getProjects4() {
        getProjects3(completion3: { deadLine, projectName, projectManager, tasks in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
            let date = dateFormatter.date(from: deadLine)
            let project = Project(projectName: projectName, projectManager: projectManager, startDate: Date(), deadLine: date!, tasks: tasks)
            self.allProjects.allProjects.append(project)
            self.projectsTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showProjectDetail"?:
            let destination = segue.destination as! ProjectDetailVC
            let cellIndex = projectsTableView.indexPathForSelectedRow
            let cell = projectsTableView.cellForRow(at: cellIndex!) as! ProjectsCell
            destination.title = cell.projectNameLabel.text
            let project = allProjects.allProjects[(cellIndex?.row)!]
            allTasks.tasks.removeAll()
            if allTasks.isAccepted[project.projectName] == nil {
                allTasks.isAccepted[project.projectName] = false
            }
            if allTasks.acceptedIndex[project.projectName] == nil {
                allTasks.acceptedIndex[project.projectName] = 0
            }
            for task in project.tasks {
                if !allTasks.tasks.contains(task.description) {
                    allTasks.tasks.append(task.description)
                }
            }
            destination.allTasks = allTasks
            break
        case "toNewProject"?:
            let navigation = segue.destination as! UINavigationController
            var vc = NewProjectVC()
            vc = navigation.viewControllers[0] as! NewProjectVC
            vc.allProjects = allProjects
            vc.id = uID
            vc.companyName = companyName
            break
        default: break
        }
    }

}
