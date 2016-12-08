//
//  MessagesVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit
import Firebase

class MessagesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messagesTableView: UITableView!
    
    var sentMessages = MessageArray()
    var receivedMessages = MessageArray()
    var archivedMessages = MessageArray()
    var deletedMessages = MessageArray()
    
    var lowLevelE = LowLevelEmployee()
    var midLevelE = MiddleLevelEmployee()
    var topLevelE = TopLevelEmployee()
    
    var uID = 0
    var companyName = ""
    var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messagesTableView.tableFooterView = UIView()
        
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
        //self.tabBarController?.title = "My Messages"
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "inbox")!
            break
        case 1:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "sent")!
            break
        case 2:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "archive")!
            break
        case 3:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "trash")!
            break
        default: break
        }
        
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            switch identifier {
            case "showInbox":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Inbox"
                destination.type = type
                destination.companyName = companyName
                destination.uID = uID
                break
            case "showSent":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Sent"
                destination.type = type
                destination.companyName = companyName
                destination.uID = uID
                break
            case "showArchive":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Archive"
                destination.type = type
                destination.companyName = companyName
                destination.uID = uID
                break
            case "showTrash":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Trash"
                destination.type = type
                destination.companyName = companyName
                destination.uID = uID
                break
            case "toNewMessage":
                let navigation = segue.destination as! UINavigationController
                var vc = NewMessageVC()
                vc = navigation.viewControllers[0] as! NewMessageVC
                vc.messageArray = sentMessages
                vc.type = type
                vc.companyName = companyName
                vc.uID = uID
                break
            default: break
            }
            
        }
    }

}
