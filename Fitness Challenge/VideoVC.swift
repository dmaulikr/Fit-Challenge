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
        
        
        //webView.loadHTMLString(videoLink.videoLink, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let videoURL = NSURL(string: videoLink.videoLink)
        let player = AVPlayer(url: videoURL as! URL)
        let av = AVPlayerViewController()
        av.player = player
        av.view.frame = self.view.bounds
        self.addChildViewController(av)
        self.view.addSubview(av.view)
        av.didMove(toParentViewController: self)
        //let playerLayer = AVPlayerLayer(player: player)
        //playerLayer.frame = self.view.bounds
        //self.view.layer.addSublayer(playerLayer)
        
        //player.play()
    }

}
