//
//  LoginViewController.swift
//  ProjectManager_Registration
//
//  Created by Stefan Francisco on 11/20/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let ref = FIRDatabase.database().reference(withPath: "pipeLine")
    var company = ""
    var id = 0
    var type = ""
    var pwRight = false
    
    @IBOutlet var errorLabel: UILabel!
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    
    @IBAction func submitData(_ sender: UIButton) {

        let ref = FIRDatabase.database().reference(withPath: "Employees")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            var counter: UInt = 1
            print(snapshot.childrenCount)
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if values.key == self.userName.text {
                    if values.childSnapshot(forPath: "password").value as! String == self.passWord.text {
                        self.company = values.childSnapshot(forPath: "company").value as! String
                        self.type = values.childSnapshot(forPath: "type").value as! String
                        self.id = values.childSnapshot(forPath: "id").value as! Int
                        self.performSegue(withIdentifier: "toStartScreen", sender: self)
                        self.pwRight = true
                    } else {
                        UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
                        self.view.makeToast(message: "Wrong password or username", duration: 0.8, position: HRToastPositionCenter as AnyObject)
                    }
                } else if snapshot.childrenCount == counter {
                    UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
                    self.view.makeToast(message: "Wrong password or username", duration: 0.8, position: HRToastPositionCenter as AnyObject)
                }
                counter += 1
            }
        })
    }
    func buttonStyle(){
        if (userName.text?.isEmpty)! || (passWord.text?.isEmpty)! {
            submit.isEnabled = false
            
        }
        else {
            submit.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.buttonStyle), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        submit.isEnabled = false
        userName.keyboardType = .emailAddress
        userName.autocorrectionType = .no
        passWord.isSecureTextEntry = true
            self.hideKeyboardWhenTappedAround()
        errorLabel.textColor = UIColor.red
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toStartScreen" {
                let destination = segue.destination as! UITabBarController
                var nc1 = UINavigationController()
                nc1 = destination.viewControllers?[0] as! UINavigationController
                let vc1 = nc1.viewControllers[0] as! ProjectsTasksVC
                vc1.uID = id
                vc1.companyName = company
                vc1.type = type
                print(destination.viewControllers?.count)
                var nc2 = UINavigationController()
                nc2 = destination.viewControllers?[1] as! UINavigationController
                let vc2 = nc2.viewControllers[0] as! CalendarVC
                vc2.uID = id
                vc2.companyName = company
                vc2.type = type
                var nc3 = UINavigationController()
                nc3 = destination.viewControllers?[2] as! UINavigationController
                let vc3 = nc3.viewControllers[0] as! MessagesVC
                vc3.uID = id
                vc3.companyName = company
                vc3.type = type
                var nc4 = UINavigationController()
                nc4 = destination.viewControllers?[3] as! UINavigationController
                let vc4 = nc4.viewControllers[0] as! RecentsVC
                vc4.uID = id
                vc4.companyName = company
                vc4.type = type
            }
        }
    }
    
    
}
