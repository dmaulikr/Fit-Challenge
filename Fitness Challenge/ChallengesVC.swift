//
//  ChallengesVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/16/16.
//  Copyright © 2016 Travis Whitten. All rights reserv
//

import UIKit

class ChallengesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBAction func addVideo(_ sender: Any) {
        
        performSegue(withIdentifier: "goToCamera", sender: self)
        
    }

    var challenge = [Challenges]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = Challenges(imageURL: "http://loganbanner.com/wp-content/uploads/2015/11/web1_Toughman-Brad-Browning-vs-Travis-Whitten1.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8GSRxD7A7Zg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Skull Crusher")
        
        challenge.append(p1)
        
      tableView.delegate = self
      tableView.dataSource = self
        //Menu button loading
        menuButton.target = revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeCell", for: indexPath) as? ChallengeCell {
            
            let challenges = challenge[indexPath.row]
            
            cell.updateUI(challenges: challenges)
            
            return cell
            
        }else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenge.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let challenges = challenge[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: challenges)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let chal = sender as? Challenges {
                destination.challenges = chal
                
            }
            
        }
    }
   
}
