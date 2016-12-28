//
//  ChallengeCell.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/16/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class ChallengeCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func updateUI(challenges: Challenges) {
        videoTitle.text = challenges.videoTitle
        
        let url = URL(string: challenges.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch {
                
            }
        }
        
    }

  
}
