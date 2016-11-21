//
//  RecentsDetailVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 19.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class RecentsDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var finishingDateLabel: UILabel!
    @IBOutlet weak var projectManagerLabel: UILabel!
    @IBOutlet weak var recentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.recentTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = recentTableView.dequeueReusableCell(withIdentifier: "taskCell")!
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }

}
