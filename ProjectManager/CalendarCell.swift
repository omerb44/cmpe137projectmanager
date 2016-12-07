//
//  CalendarCell.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 05.12.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class CalendarCell: UITableViewCell {
    @IBOutlet weak var dateName: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var datePlace: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
