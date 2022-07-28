//
//  SurveyListTableViewCell.swift
//  Survey
//
//  Created by BTS.id on 27/07/22.
//

import UIKit

class SurveyListTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryImageThumbnail: UIImageView!
    @IBOutlet weak var namaSurvey: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
