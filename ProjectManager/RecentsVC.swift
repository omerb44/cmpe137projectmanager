//
//  RecentsVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit
import Firebase

class RecentsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var recentsTableView: UITableView!
    
    var allProjects = AllProjectsArray()
    
    var lowLevelE = LowLevelEmployee()
    var midLevelE = MiddleLevelEmployee()
    var topLevelE = TopLevelEmployee()
    
    var uID = 0
    var companyName = ""
    var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.recentsTableView.tableFooterView = UIView()
        
        print(uID)
        
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
                            print("asdfsdF" + String(describing: self.lowLevelE.id))
                            print(self.uID)
                            print("§$werw")
                        }
                    }
                }
            })
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
                        print(self.topLevelE.id)
                        print(self.uID)
                    }
                }
            })
            break
        default: break
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "Recent Projects"
        self.recentsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProjects.allProjects.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = recentsTableView.dequeueReusableCell(withIdentifier: "testCell")! as! RecentsCell
        let z = cell as! RecentsCell
        z.projectManagerLabel.text = allProjects.allProjects[indexPath.row].projectManager.fullName
        z.titleLabel.text = allProjects.allProjects[indexPath.row].projectName
        z.dateLabel.text = self.formatter.string(from: allProjects.allProjects[indexPath.row].deadLine)
        cell = z
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   

}
