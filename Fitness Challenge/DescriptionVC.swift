//
//  DescriptionVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/29/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {

    @IBOutlet weak var viaSegueLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func joinBtnPresses(_ sender: Any) {
        
        performSegue(withIdentifier: "goToJoingChallenge", sender: self)
        
    }
    
    
    var challengeTitle = ""
    var challengeDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viaSegueLabel.text = challengeTitle
        descriptionLabel.text = challengeDescription
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
