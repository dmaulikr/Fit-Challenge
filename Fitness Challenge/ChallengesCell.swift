//
//  ChallengesCell.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/29/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class ChallengesCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    
    //var challenge: Challenge!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(challenge: Challenge) {
        title.text = challenge.title  
    }

}
