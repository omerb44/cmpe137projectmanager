//
//  CalendarDetailVC.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 21.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class CalendarDetailVC: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var dateTitelLabel: UILabel!
    @IBOutlet weak var datePlaceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var okayButton: UIButton!
    @IBAction func okButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.borderColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6).cgColor
        popupView.layer.borderWidth = 1
        popupView.layer.cornerRadius = 5
        
        okayButton.layer.borderColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6).cgColor
        okayButton.layer.borderWidth = 1
        okayButton.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
