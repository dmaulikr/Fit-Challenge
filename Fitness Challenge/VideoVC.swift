//
//  VideoVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/17/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBAction func backToChallenges(_ sender: Any) {
        
        performSegue(withIdentifier: "backToChallenges", sender: nil)
    }
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
