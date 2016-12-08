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
    var ceo = TopLevelEmployee()

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
        
        numberOfEmployees.autocorrectionType = .no

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
            ceo = TopLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
            let ceo2 = MiddleLevelEmployee(firstName: firstname, lastName: lastname, email: email, userName: username, password: password, company: company)
            ceo2.id = ceo.id
            
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
        
            self.type = ceo.type
            let ref3 = FIRDatabase.database().reference(withPath: "Employees")
            ref3.child(username).setValue(ceo.toAnyObject())
            
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
                var nc1 = UINavigationController()
                nc1 = destination.viewControllers?[0] as! UINavigationController
                let vc1 = nc1.viewControllers[0] as! ProjectsTasksVC
                vc1.uID = uID
                vc1.companyName = companyname
                vc1.type = type
                var nc2 = UINavigationController()
                nc2 = destination.viewControllers?[1] as! UINavigationController
                let vc2 = nc2.viewControllers[0] as! CalendarVC
                vc2.uID = uID
                vc2.companyName = companyname
                vc2.type = type
                var nc3 = UINavigationController()
                nc3 = destination.viewControllers?[2] as! UINavigationController
                let vc3 = nc3.viewControllers[0] as! MessagesVC
                vc3.uID = uID
                vc3.companyName = companyname
                vc3.type = type
                var nc4 = UINavigationController()
                nc4 = destination.viewControllers?[3] as! UINavigationController
                let vc4 = nc4.viewControllers[0] as! RecentsVC
                vc4.uID = uID
                vc4.companyName = companyname
                vc4.type = type
            }
        }
    }
    

   }
