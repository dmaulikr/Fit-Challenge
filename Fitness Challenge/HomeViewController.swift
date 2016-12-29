//
//  HomeViewController.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/29/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate, UINavigationControllerDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var challenges = [Challenge]()
    
    
    @IBOutlet weak var homeButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
            self.tableView.reloadData()
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengesCell") as? ChallengesCell {
            cell.configureCell(challenge: challenge)
            return cell
        } else {
            return ChallengesCell()
        }
        
    }
}
