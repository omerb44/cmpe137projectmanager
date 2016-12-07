//
//  ProjectDetailCell.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 05.12.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class ProjectDetailCell: UITableViewCell {

    var isAccepted = false
    
    @IBOutlet weak var finished: UIButton!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var accept: UIButton!
    @IBAction func acceptAction(_ sender: Any) {
        accept.isHidden = true
        finished.isHidden = false
        isAccepted = true
    }
    
    @IBAction func help(_ sender: Any) {
        
    }
    
    func accepted() {
        accept.isEnabled = false
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        finished.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
