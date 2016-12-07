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
    @IBAction func done(_ sender: Any) {
        let date = Date()
        if !(projectNameTextField.text?.isEmpty)! && deadLineDatePicker.date > date {
            var taskDescriptions = [String]()
            for cell in tasksTableView.visibleCells {
                let z = cell as! NewProjectCell
                if !(z.taskDescriptionTextField.text?.isEmpty)! {
                    taskDescriptions.append(z.taskDescriptionTextField.text!)
                }
            }
            var tasks = [Task]()
            for taskDecription in taskDescriptions {
                let task = Task(description: taskDecription, workingEmployee: LowLevelEmployee(firstName: "Oemer", lastName: "Baydar", email: "oemerb44@gmail.com", userName: "", password: "", company: ""), deadLine: deadLineDatePicker.date)
                tasks.append(task)
            }
            let project = Project(projectName: projectNameTextField.text!, projectManager: MiddleLevelEmployee(firstName: "Oemer", lastName: "Baydar", email: "oemerb44@gmail.com", userName: "", password: "", company: ""), startDate: date, deadLine: deadLineDatePicker.date, tasks: tasks)
            allProjects.allProjects.append(project)
            dismiss(animated: true, completion: nil)
        }
    }
    
    var allProjects = AllProjectsArray()

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
