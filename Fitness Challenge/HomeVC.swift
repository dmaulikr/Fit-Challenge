//
//  HomeVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/28/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController,UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate, UINavigationControllerDelegate {

    var challenges = [Challenge]()
   
    @IBOutlet weak var challengesTV: UITableView!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Getting database references
        DataService.ds.REF_CHALLENGES.observe(.value, with: { (snapshot) in
            
            self.challenges = [] //clears out challenges array at the beginning of listener
            
            print(snapshot.value!)
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let challengeDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let challenge = Challenge(challengeKey: key, challengeData: challengeDict)
                        self.challenges.append(challenge)
                    }
                }
            }
            self.challengesTV.reloadData()
        })

        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        homeButton.target = revealViewController()
        homeButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return challenges.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let challenge = challenges[indexPath.row]
        print("WHITTEN: \(challenge.description)")
        
        return challengesTV.dequeueReusableCell(withIdentifier: "ChallengesCell") as! ChallengesCell
    }

   

}
