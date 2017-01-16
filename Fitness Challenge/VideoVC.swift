//
//  VideoVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/3/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    private var _videoLink: Leaderboard!
    
    var videoLink: Leaderboard {
        get {
            return _videoLink
        } set {
            _videoLink = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadHTMLString(videoLink.videoLink, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
