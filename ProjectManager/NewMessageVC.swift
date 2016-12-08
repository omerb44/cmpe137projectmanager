//
//  NewMessageVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 20.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit
import Firebase

class NewMessageVC: UIViewController {
    
    var messageArray = MessageArray()
    
    var lowLevelE = LowLevelEmployee()
    var midLevelE = MiddleLevelEmployee()
    var topLevelE = TopLevelEmployee()
    
    var uID = 0
    var companyName = ""
    var type = ""

    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sendMessage(_ sender: Any) {
        if !(toTextField.text?.isEmpty)! && !(subjectTextField.text?.isEmpty)! && !(messageTextView.text?.isEmpty)! {
            let message = Message(senderID: uID, toID: Int(toTextField.text!)!, subject: subjectTextField.text!, message: messageTextView.text!, date: Date(), isRead: false)
            messageArray.messages.append(message)
            print(companyName)
            let ref = FIRDatabase.database().reference(withPath: companyName)
            switch type {
            case "LowLevelEmployee":
                let ref2 = ref.child("lowLevelEmployees")
                ref2.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if values.key != "0" {
                            if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                                let ref3 = ref2.child(values.key).child("sentMail").child(message.subject)
                                ref3.setValue(message.toAnyObject())
                            }
                        }
                    }
                })
                let ref21 = ref.child("lowLevelEmployees")
                ref21.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if values.key != "0" {
                            if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                                let ref3 = ref21.child(values.key).child("receivedMail").child(message.subject)
                                ref3.setValue(message.toAnyObject())
                            }
                        }
                    }
                })
                let ref22 = ref.child("middleLevelEmployees")
                ref22.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref22.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                let ref23 = ref.child("topLevelEmployees")
                ref23.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref23.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                break
            case "MiddleLevelEmployee":
                let ref2 = ref.child("middleLevelEmployees")
                ref2.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref2.child(values.key).child("sentMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                let ref21 = ref.child("lowLevelEmployees")
                ref21.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if values.key != "0" {
                            if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                                let ref3 = ref21.child(values.key).child("receivedMail").child(message.subject)
                                ref3.setValue(message.toAnyObject())
                            }
                        }
                    }
                })
                let ref22 = ref.child("middleLevelEmployees")
                ref22.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref22.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                let ref23 = ref.child("topLevelEmployees")
                ref23.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref23.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })

                break
            case "TopLevelEmployee":
                let ref2 = ref.child("topLevelEmployees")
                ref2.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if self.uID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref2.child(values.key).child("sentMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                let ref21 = ref.child("lowLevelEmployees")
                ref21.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if values.key != "0" {
                            if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                                let ref3 = ref21.child(values.key).child("receivedMail").child(message.subject)
                                ref3.setValue(message.toAnyObject())
                            }
                        }
                    }
                })
                let ref22 = ref.child("middleLevelEmployees")
                ref22.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref22.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })
                let ref23 = ref.child("topLevelEmployees")
                ref23.observeSingleEvent(of: .value, with: { snapshot in
                    for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                        if message.toID == values.childSnapshot(forPath: "id").value as! Int {
                            let ref3 = ref23.child(values.key).child("receivedMail").child(message.subject)
                            ref3.setValue(message.toAnyObject())
                        }
                    }
                })

                break
            default: break
            }
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toTextField.useUnderline()
        subjectTextField.useUnderline()
        
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

}
