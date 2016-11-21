//
//  NewProjectVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 20.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class NewProjectVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var deadLineDatePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func newTaskCell(_ sender: Any) {
        tasksCount += 1
        self.tasksTableView.reloadData()
    }

    var tasksCount = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        descriptionTextView.text = "Projectdescription"
        descriptionTextView.textColor = UIColor.lightGray
        descriptionTextView.contentInset = UIEdgeInsetsMake(-7.0,0.0,0,0.0);
        projectNameTextField.useUnderline()
        self.tasksTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tasksTableView.dequeueReusableCell(withIdentifier: "tasksCell")! as! NewProjectCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Projectdescription"
            textView.textColor = UIColor.lightGray
        }
    }

}
