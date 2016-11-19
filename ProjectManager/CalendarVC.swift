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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.scopeGesture.isEnabled = true
        
        datesTableView.tableFooterView = UIView()
        self.datesTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "My Calendar"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datesTableView.dequeueReusableCell(withIdentifier: "testCell")!
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
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


}
