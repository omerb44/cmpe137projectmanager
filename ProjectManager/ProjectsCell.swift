//
//  ProjectsCell.swift
//  ProjectManager
//
//  Created by Ömer Baydar on 18.11.16.
//  Copyright © 2016 cmpe137. All rights reserved.
//

import UIKit

class ProjectsCell: UITableViewCell {

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var percentFinishedView: UIProgressView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectManagerNameLabel: UILabel!
    @IBOutlet weak var percentageFinishedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        percentFinishedView.progress = 0.75
        percentFinishedView.progressTintColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6)
        percentFinishedView.trackTintColor = UIColor.white
        percentFinishedView.layer.cornerRadius = 3
        percentFinishedView.layer.borderWidth = 0.7
        percentFinishedView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagView.layer.cornerRadius = tagView.frame.width / 2
        tagView.backgroundColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.6)
    }

}
