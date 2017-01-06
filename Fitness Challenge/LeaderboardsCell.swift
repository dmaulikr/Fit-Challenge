//
//  LeaderboardsCell.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/2/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class LeaderboardsCell: UITableViewCell {
    @IBOutlet weak var repsLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        
    
    
    func configureCell(leader: Leaderboard) {
        
        userNameLbl.text = leader.userName
        repsLbl.text = leader.reps
        //let videoLink = leader.videoLink
       // userNameLbl.text = userName as! String?
    }

}
