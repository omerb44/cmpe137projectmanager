//
//  NewMessageVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 20.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class NewMessageVC: UIViewController {

    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toTextField.useUnderline()
        subjectTextField.useUnderline()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
