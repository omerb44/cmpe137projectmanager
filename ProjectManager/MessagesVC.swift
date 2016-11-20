//
//  MessagesVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class MessagesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messagesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messagesTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "My Messages"
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "inbox")!
            break
        case 1:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "sent")!
            break
        case 2:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "archive")!
            break
        case 3:
            cell = messagesTableView.dequeueReusableCell(withIdentifier: "trash")!
            break
        default: break
        }
        
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            let destination = segue.destination as! MessagesAllVC
            switch identifier {
            case "showInbox":
                destination.title = "Inbox"
                break
            case "showSent":
                destination.title = "Sent"
                break
            case "showArchive":
                destination.title = "Archive"
                break
            case "showTrash":
                destination.title = "Trash"
                break
            default: break
            }
            
        }
    }

}
