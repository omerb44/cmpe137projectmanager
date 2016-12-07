//
//  RecentsVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class RecentsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var recentsTableView: UITableView!
    
    var allProjects = AllProjectsArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.recentsTableView.tableFooterView = UIView()
        //self.recentsTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "Recent Projects"
        self.recentsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProjects.allProjects.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = recentsTableView.dequeueReusableCell(withIdentifier: "testCell")! as! RecentsCell
        let z = cell as! RecentsCell
        z.projectManagerLabel.text = allProjects.allProjects[indexPath.row].projectManager.fullName
        z.titleLabel.text = allProjects.allProjects[indexPath.row].projectName
        z.dateLabel.text = self.formatter.string(from: allProjects.allProjects[indexPath.row].deadLine)
        cell = z
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   

}
