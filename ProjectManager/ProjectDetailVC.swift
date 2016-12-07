//
//  ProjectDetailVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class ProjectDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var percentageView: UIProgressView!
    @IBOutlet weak var deadLineLabel: UILabel!
    @IBOutlet weak var projectTableView: UITableView!
    
    var allTasks = AllTasksArray()
    var tasksFinished = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.projectTableView.tableFooterView = UIView()
        self.projectTableView.allowsSelection = true
    //    if tasksFinished != 0 {
    //        let progress = Float(tasksFinished / allTasks.tasks.count)
    //        percentageView.setProgress(progress, animated: true)
    //    }
        percentageView.progressTintColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6)
        percentageView.trackTintColor = UIColor.white
        percentageView.layer.cornerRadius = 3
        percentageView.layer.borderWidth = 0.7
        percentageView.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = projectTableView.dequeueReusableCell(withIdentifier: "taskCell")! as! ProjectDetailCell
        cell.selectionStyle = .none
        let z = cell as! ProjectDetailCell
        z.taskDescriptionLabel.text = allTasks.tasks[indexPath.row]
        z.accept.tag = indexPath.row
        z.finished.tag = indexPath.row
        z.finished.addTarget(self, action: #selector(finished(_:)), for: .touchUpInside)
        z.accept.addTarget(self, action: #selector(accepted(_:)), for: .touchUpInside)
        if allTasks.isAccepted[self.title!]! {
            if indexPath.row == allTasks.acceptedIndex[self.title!]! {
                z.accept.sendActions(for: .touchUpInside)
            } else {
                z.accept.isEnabled = false
            }
        }
        cell = z
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func accepted(_ sender: UIButton) {
        for cell in projectTableView.visibleCells {
            let z = cell as! ProjectDetailCell
            if z.accept.tag != sender.tag {
                z.accepted()
                if !allTasks.isAccepted[self.title!]! {
                    allTasks.isAccepted[self.title!]! = true
                    allTasks.acceptedIndex[self.title!]! = sender.tag
                }
            }
        }
    }
    
    func finished(_ sender: UIButton) {
       // tasksFinished += 1
      //  let progress = Float(tasksFinished / allTasks.tasks.count)
        percentageView.setProgress(0.75, animated: true)

    }

}
