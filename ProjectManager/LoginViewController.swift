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
            for values in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if values.key == self.userName.text {
                    if values.childSnapshot(forPath: "password").value as! String == self.passWord.text {
                        self.company = values.childSnapshot(forPath: "company").value as! String
                        self.type = values.childSnapshot(forPath: "type").value as! String
                        self.id = values.childSnapshot(forPath: "id").value as! Int
                        self.performSegue(withIdentifier: "toStartScreen", sender: self)
                    } else {
                        UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
                        self.view.makeToast(message: "Wrong password or username", duration: 0.8, position: HRToastPositionCenter as AnyObject)
                    }
                } else {
                    UIView.hr_setToastThemeColor(color: UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6))
                    self.view.makeToast(message: "Wrong password or username", duration: 0.8, position: HRToastPositionCenter as AnyObject)
                }
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
                var nc = UINavigationController()
                nc = destination.viewControllers?[0] as! UINavigationController
                let vc = nc.viewControllers[0] as! ProjectsTasksVC
                vc.uID = id
                vc.companyName = company
                vc.type = type
            }
        }
    }
    
    
}
