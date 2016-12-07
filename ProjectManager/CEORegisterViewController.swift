//
//  CEORegisterViewController.swift
//  137ProjectFinal_1
//
//  Created by Stefan Francisco on 12/5/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase
class CEORegisterViewController: UIViewController {
    
    var uID = 0
    var companyname = ""
    var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.textColor = UIColor.red
        
        eMail.autocorrectionType = .no
        eMail.keyboardType = .emailAddress
        
        firstName.autocorrectionType = .no
        firstName.autocapitalizationType = .words
        lastName.autocorrectionType = .no
        lastName.autocapitalizationType = .words
        
        companyName.autocorrectionType = .no
        companyName.autocapitalizationType = .words
        
        userName.autocorrectionType = .no
        
        passWord.autocorrectionType = .no
        passWord.isSecureTextEntry = true
        self.hideKeyboardWhenTappedAround()

    }
    @IBOutlet var errorLabel: UILabel!
    @IBAction func dismiss(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var eMail: UITextField!
    @IBOutlet var companyName: UITextField!
    @IBOutlet var numberOfEmployees: UITextField!
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBAction func nextData(_ sender: UIButton) {
        if !firstName.text!.isEmpty && !lastName.text!.isEmpty && !eMail.text!.isEmpty && !userName.text!.isEmpty &&
            !passWord.text!.isEmpty && !companyName.text!.isEmpty && !numberOfEmployees.text!.isEmpty {
            let firstname = firstName.text!
            let lastname = lastName.text!
            let email = eMail.text!
            let username = userName.text!
            let password = passWord.text!
            let company = companyName.text!
            let number = Int(numberOfEmployees.text!)!
            let ref = FIRDatabase.database().reference(fromURL: "https://project-manager-26df1.firebaseio.com/")
            let ref2 = FIRDatabase.database().reference(withPath: company)
            
            let companyNew = Company(name: company, employeeCount: number)
            let ceo = TopLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
            let ceo2 = MiddleLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
            
            companyNew.middleLevelEmployees.append(ceo2)
            companyNew.topLevelEmployees.append(ceo)
            
            uID = ceo.id
            companyname = companyNew.name
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild(company){
                    self.errorLabel.text = "Company already exists."
                    self.errorLabel.textColor = UIColor.red
                    self.companyName.textColor = UIColor.red
                } else {
                    ref2.setValue(companyNew.toAnyObject())
                }
            })
            
            let newUser = TopLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
            self.type = newUser.type
            let ref3 = FIRDatabase.database().reference(withPath: "Employees")
            ref3.child(username).setValue(newUser.toAnyObject())
            
            self.performSegue(withIdentifier: "toStartScreen", sender: self)
        } else {
            UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
            self.view.makeToast(message: "Please fill out all fields!", duration: 0.8, position: HRToastPositionCenter as AnyObject)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toStartScreen" {
                let destination = segue.destination as! UITabBarController
                var nc = UINavigationController()
                nc = destination.viewControllers?[0] as! UINavigationController
                let vc = nc.viewControllers[0] as! ProjectsTasksVC
                vc.uID = uID
                vc.companyName = companyname
                vc.type = type
            }
        }
    }
    

   }
