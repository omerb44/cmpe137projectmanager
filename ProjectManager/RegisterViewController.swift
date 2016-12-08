//
//  CEORegisterViewController.swift
//  ProjectManager_Registration
//
//  Created by Stefan Francisco on 11/18/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase

class EmployeeRegister2ViewController: UIViewController {
    
    var companyName = ""
    var uID = 0
    var type = ""
    var newUser = LowLevelEmployee()
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var code: UITextField!
    @IBOutlet var eMailLabel: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    
    @IBAction func submitData(_ sender: UIButton) {
        if !firstName.text!.isEmpty && !lastName.text!.isEmpty && !eMail.text!.isEmpty && !userName.text!.isEmpty && !passWord.text!.isEmpty && !company.text!.isEmpty {
            let firstname = firstName.text!
            let lastname = lastName.text!
            let email = eMail.text!
            let companyy = company.text!
            companyName = companyy
            let username = userName.text!
            let password = passWord.text!
            let key = code.text!
            
            let ref2 = FIRDatabase.database().reference(withPath: companyy)
            
            ref2.child("accessCodes").observeSingleEvent(of: .value, with: { (snapshot) in
                for value in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    if let valueN = value.value as? String {
                        if value.value as! String == key {
                            self.newUser = LowLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: companyy)
                            self.uID = self.newUser.id
                            self.type = self.newUser.type
                            let newUserRef = ref2.child("accessCodes").child(value.key)
                            newUserRef.setValue(self.newUser.toAnyObject())
                            let lowLevelRef = ref2.child("lowLevelEmployees").child(self.newUser.lastName)
                            lowLevelRef.setValue(self.newUser.toAnyObject())
                            self.performSegue(withIdentifier: "toStartScreen", sender: self)
                            let ref3 = FIRDatabase.database().reference(withPath: "Employees")
                            ref3.child(username).setValue(self.newUser.toAnyObject())
                        }
                    }
                }
            })
        } else {
            UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
            self.view.makeToast(message: "Please fill out all fields!", duration: 0.8, position: HRToastPositionCenter as AnyObject)
        }
        
    }
    
    
    
    func buttonStyle(){
        if (firstName.text?.isEmpty)! || (lastName.text?.isEmpty)! || (eMail.text?.isEmpty)! || (company.text?.isEmpty)! || (userName.text?.isEmpty)!
            
        {
            submit.isEnabled = false
            
        }
        else
        {
            submit.isEnabled = true
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override
    func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(EmployeeRegister2ViewController.buttonStyle), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        submit.isEnabled = false
        errorLabel.textColor = UIColor.red
        code.autocorrectionType = .no
        code.keyboardType = .numberPad
    
        eMail.autocorrectionType = .no
        eMail.keyboardType = .emailAddress
        
        firstName.autocorrectionType = .no
        firstName.autocapitalizationType = .words
        lastName.autocorrectionType = .no
        lastName.autocapitalizationType = .words
        
        company.autocorrectionType = .no
        company.autocapitalizationType = .words
        
        userName.autocorrectionType = .no
        
        passWord.autocorrectionType = .no
        passWord.isSecureTextEntry = true
        self.hideKeyboardWhenTappedAround()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toStartScreen" {
                let destination = segue.destination as! UITabBarController
                var nc1 = UINavigationController()
                nc1 = destination.viewControllers?[0] as! UINavigationController
                let vc1 = nc1.viewControllers[0] as! ProjectsTasksVC
                vc1.uID = uID
                vc1.companyName = companyName
                vc1.type = type
                var nc2 = UINavigationController()
                nc2 = destination.viewControllers?[1] as! UINavigationController
                let vc2 = nc2.viewControllers[0] as! CalendarVC
                vc2.uID = uID
                vc2.companyName = companyName
                vc2.type = type
                var nc3 = UINavigationController()
                nc3 = destination.viewControllers?[2] as! UINavigationController
                let vc3 = nc3.viewControllers[0] as! MessagesVC
                vc3.uID = uID
                vc3.companyName = companyName
                vc3.type = type
                var nc4 = UINavigationController()
                nc4 = destination.viewControllers?[3] as! UINavigationController
                let vc4 = nc4.viewControllers[0] as! RecentsVC
                vc4.uID = uID
                vc4.companyName = companyName
                vc4.type = type
            }
        }
    }
    
}
