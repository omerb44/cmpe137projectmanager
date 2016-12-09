//
//  SettingsAllVC.swift
//  ProjectManager
//
//  Created by Stefan Francisco on 11/28/16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class SettingsAllVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var notificationsTable: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row{
        case 0:
            cell = notificationsTable.dequeueReusableCell(withIdentifier: "newTasks")!
            break;
        case 1:
            cell = notificationsTable.dequeueReusableCell(withIdentifier: "taskDeadlines")!
            break;
        case 2:
            cell = notificationsTable.dequeueReusableCell(withIdentifier: "updatedTasks")!
            break;
            
        default:
            break;
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notificationsTable.tableFooterView = UIView()
        self.notificationsTable.allowsSelection = false
        
        self.notificationsTable.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
