//
//  SettingsAllVC.swift
//  ProjectManager
//
//  Created by Stefan Francisco on 11/28/16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class AccountInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViews: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row{
        case 0:
            cell = tableViews.dequeueReusableCell(withIdentifier: "firstName")!
            break;
        case 1:
            cell = tableViews.dequeueReusableCell(withIdentifier: "lastName")!
            break;
        case 2:
            cell = tableViews.dequeueReusableCell(withIdentifier: "email")!
            break;
        case 3:
            cell = tableViews.dequeueReusableCell(withIdentifier: "password")!
            break;
            
        default:
            break;
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViews.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViews.tableFooterView = UIView()
        self.tableViews.allowsSelection = false
        self.tableViews.isScrollEnabled = false
        
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
