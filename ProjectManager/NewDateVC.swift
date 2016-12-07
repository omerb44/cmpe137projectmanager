//
//  NewDateVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 20.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class NewDateVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var calendar = Calendar()

    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        let date = Date()
        if !(datePlace.text?.isEmpty)! && !(dateTitel.text?.isEmpty)! && dateDatePicker.date > date {
            let calDate = CalendarDate(titel: dateTitel.text!, place: datePlace.text!, date: dateDatePicker.date)
            calendar.dates.append(calDate)
            dismiss(animated: true, completion: nil)
        }
    }
    @IBOutlet weak var datePlace: UITextField!
    @IBOutlet weak var dateTitel: UITextField!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var switchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.switchTableView.tableFooterView = UIView()
        datePlace.useUnderline()
        dateTitel.useUnderline()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = switchTableView.dequeueReusableCell(withIdentifier: "onlyMe")!
            break
        case 1:
            cell = switchTableView.dequeueReusableCell(withIdentifier: "everyone")!
            break
        default: break
        }

        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }

}
