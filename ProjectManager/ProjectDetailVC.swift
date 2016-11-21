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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.projectTableView.tableFooterView = UIView()
        self.projectTableView.allowsSelection = false
        percentageView.progress = 0.75
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = projectTableView.dequeueReusableCell(withIdentifier: "taskCell")!
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }

}
