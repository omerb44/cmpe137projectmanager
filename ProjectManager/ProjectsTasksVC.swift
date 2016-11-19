//
//  ProjectsTasksVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class ProjectsTasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var projectsTableView: UITableView!

    @IBOutlet weak var percentFinishedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.projectsTableView.layoutSubviews()
        self.projectsTableView.tableFooterView = UIView()
        self.projectsTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "My Projects"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsTableView.dequeueReusableCell(withIdentifier: "testCell")!
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showProjectDetail"?:
            let destination = segue.destination as! ProjectDetailVC
            let cellIndex = projectsTableView.indexPathForSelectedRow
            let cell = projectsTableView.cellForRow(at: cellIndex!) as! ProjectsCell
            destination.title = cell.projectNameLabel.text
            break
        default: break
        }
    }

}
