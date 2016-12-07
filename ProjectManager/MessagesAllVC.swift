//
//  MessagesAllVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 20.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class MessagesAllVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var allMessagesTableView: UITableView!
    
    var sentMessages = MessageArray()
    var receivedMessages = MessageArray()
    var archivedMessages = MessageArray()
    var deletedMessages = MessageArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allMessagesTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.title! {
        case "Inbox":
            return receivedMessages.messages.count
        case "Sent":
            return sentMessages.messages.count
        case "Archive":
            return archivedMessages.messages.count
        case "Trash":
            return deletedMessages.messages.count
        default: return 0
        }
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
        cell = allMessagesTableView.dequeueReusableCell(withIdentifier: "testCell")! as! MessagesCell
        let z = cell as! MessagesCell
        switch self.title! {
        case "Inbox":
            z.dateLabel.text = self.formatter.string(from: receivedMessages.messages[indexPath.row].date)
            z.nameLabel.text = String(describing: receivedMessages.messages[indexPath.row].senderID)
            z.subjectLabel.text = receivedMessages.messages[indexPath.row].subject
            z.messagePreviewLabel.text = receivedMessages.messages[indexPath.row].message
            break
        case "Sent":
            z.dateLabel.text = self.formatter.string(from: sentMessages.messages[indexPath.row].date)
            z.nameLabel.text = String(describing: sentMessages.messages[indexPath.row].senderID)
            z.subjectLabel.text = sentMessages.messages[indexPath.row].subject
            z.messagePreviewLabel.text = sentMessages.messages[indexPath.row].message
            break
        case "Archive":
            z.dateLabel.text = self.formatter.string(from: archivedMessages.messages[indexPath.row].date)
            z.nameLabel.text = String(describing: archivedMessages.messages[indexPath.row].senderID)
            z.subjectLabel.text = archivedMessages.messages[indexPath.row].subject
            z.messagePreviewLabel.text = archivedMessages.messages[indexPath.row].message
            break
        case "Trash":
            z.dateLabel.text = self.formatter.string(from: deletedMessages.messages[indexPath.row].date)
            z.nameLabel.text = String(describing: deletedMessages.messages[indexPath.row].senderID)
            z.subjectLabel.text = deletedMessages.messages[indexPath.row].subject
            z.messagePreviewLabel.text = deletedMessages.messages[indexPath.row].message
            break
        default: break
        }
        cell = z
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if self.title! == "Trash" {
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            switch self.title! {
            case "Inbox":
                deletedMessages.messages.append(receivedMessages.messages[indexPath.row])
                receivedMessages.messages.remove(at: indexPath.row)
                break
            case "Sent":
                deletedMessages.messages.append(sentMessages.messages[indexPath.row])
                sentMessages.messages.remove(at: indexPath.row)
                break
            case "Archive":
                deletedMessages.messages.append(sentMessages.messages[indexPath.row])
                archivedMessages.messages.remove(at: indexPath.row)
                break
            default: break
            }
            allMessagesTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    


}
