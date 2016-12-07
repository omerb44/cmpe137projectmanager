//
//  CalendarVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 14.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource  {
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var datesTableView: UITableView!
    
    private let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    var calendarAll = Calendar()
    
    var rowCount = 0
    
    var cellDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.scopeGesture.isEnabled = true
        
        self.datesTableView.tableFooterView = UIView()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "My Calendar"
        self.calendar.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datesTableView.dequeueReusableCell(withIdentifier: "testCell")! as! CalendarCell
        
        for dates in calendarAll.dates {
            let dateN = dates.date
            let dateNew = self.formatter.string(from: dateN)
            if dateNew == cellDate {
                let day: Int! = self.gregorian.component(.day, from: dates.date)
                let month: Int! = self.gregorian.component(.month, from: dates.date)
                cell.dateTitle.text = dates.titel
                cell.datePlace.text = dates.place
                var monthString = ""
                switch month {
                case 1: monthString = "JAN"
                case 2: monthString = "FEB"
                case 3: monthString = "MAR"
                case 4: monthString = "APR"
                case 5: monthString = "MAY"
                case 6: monthString = "JUN"
                case 7: monthString = "JUL"
                case 8: monthString = "AUG"
                case 9: monthString = "SEP"
                case 10: monthString = "OKT"
                case 11: monthString = "NOV"
                case 12: monthString = "DEZ"
                default: monthString = ""
                }
                cell.dateName.text! = String(describing: day!) + " " + monthString
            }
        }
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let day: Int! = self.gregorian.component(.day, from: date)
        var i = [Int]()
        for dates in calendarAll.dates {
            let dayC: Int! = self.gregorian.component(.day, from: dates.date)
            i.append(dayC)
        }
        return i.contains(day) ? 1 : 0
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        print("calendar did select date \(self.formatter.string(from: date))")
        let dateFS = self.formatter.string(from: date)
        for dates in calendarAll.dates {
            let dateN = dates.date
            let dateNew = self.formatter.string(from: dateN)
            if dateNew == dateFS {
                cellDate = dateNew
                rowCount = 1
                datesTableView.reloadData()
            } else {
                rowCount = 0
                datesTableView.reloadData()
            }
        }

    }
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2015/01/01")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2017/10/31")!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toNewDate"?:
            let navigation = segue.destination as! UINavigationController
            var vc = NewDateVC()
            vc = navigation.viewControllers[0] as! NewDateVC
            vc.calendar = calendarAll
            break
        case "toPopup"?:
            let destination = segue.destination as! CalendarDetailVC
            let cellIndex = datesTableView.indexPathForSelectedRow
            let cell = datesTableView.cellForRow(at: cellIndex!) as! CalendarCell
            let dateInfos = DateInfos()
            dateInfos.array.append(cell.dateTitle.text!)
            dateInfos.array.append(cell.datePlace.text!)
            dateInfos.array.append(cell.dateName.text!)
            destination.dateInfo = dateInfos
            break
        default: break
        }
    }



}
