//
//  JoinChallengeVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/1/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class JoinChallengeVC: UIViewController {

    @IBOutlet weak var videoLink: UITextField!
    
    @IBOutlet weak var repAmount: UITextField!
    
    @IBAction func submitPressed(_ sender: Any) {
        let uid = FIRAuth.auth()!.currentUser!.uid
        if let video = videoLink.text, let reps = repAmount.text, (video.characters.count > 0 && reps.characters.count > 0) {
            DataService.ds.REF_CHALLENGES.childByAutoId().setValue(["title": title ,"description": description])
        }

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    
    

}
