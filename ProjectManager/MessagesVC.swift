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
    
    var sentMessages = MessageArray()
    var receivedMessages = MessageArray()
    var archivedMessages = MessageArray()
    var deletedMessages = MessageArray()

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
            
            switch identifier {
            case "showInbox":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Inbox"
                break
            case "showSent":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Sent"
                break
            case "showArchive":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Archive"
                break
            case "showTrash":
                let destination = segue.destination as! MessagesAllVC
                destination.sentMessages = sentMessages
                destination.receivedMessages = receivedMessages
                destination.archivedMessages = archivedMessages
                destination.deletedMessages = deletedMessages
                destination.title = "Trash"
                break
            case "toNewMessage":
                let navigation = segue.destination as! UINavigationController
                var vc = NewMessageVC()
                vc = navigation.viewControllers[0] as! NewMessageVC
                vc.messageArray = sentMessages
                break
            default: break
            }
            
        }
    }

}
