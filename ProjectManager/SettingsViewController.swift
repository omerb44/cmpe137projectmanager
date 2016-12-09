//
//  SettingsVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
            cell = settingsTable.dequeueReusableCell(withIdentifier: "cell")!
            break;
        case 1:
            cell = settingsTable.dequeueReusableCell(withIdentifier: "cell2")!
            break;
        case 2:
            cell = settingsTable.dequeueReusableCell(withIdentifier: "signout")!
            
            break;
            
            
        default:
            break;
        }
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingsTable.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "Settings"
    }
    
    @IBOutlet var settingsTable: UITableView!

    
    
    
}

