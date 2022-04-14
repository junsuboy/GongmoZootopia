//
//  GongmoZooCell.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//

import UIKit

class GongmoZooCell: UITableViewCell {
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var stockTypeLabel: UILabel!
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var gongmoDateLabel: UILabel!
    @IBOutlet weak var ddayLabel: UILabel!
    @IBOutlet weak var zuganLabel: UILabel!
    @IBOutlet weak var zugan2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
