//
//  LeaderboardsVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/2/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase


class LeaderboardsVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    var maleLeaders = [Leaderboard]()
    var femaleLeaders = [Leaderboard]()
    
    
    var challengeTitle = ""
    var challengeDescription = ""
    var challengeKey = ""
    var videoURL: URL?
    var userName = String()
    
   
   
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    
    
    @IBOutlet var leaderTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        leaderTV.delegate = self
        leaderTV.dataSource = self
        
        //let currentUser = FIRAuth.auth()!.currentUser!.uid
        
        let query = DataService.ds.REF_LEADERBOARDS.child(self.challengeKey).queryOrdered(byChild: "reps").queryLimited(toLast: 10)
        query.observe(.value, with: { (snapshot) in
            
            self.maleLeaders = []
            self.femaleLeaders = []
            
           // print("WHITTEN: \(snapshot)")
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let leaderDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let gender = snap.childSnapshot(forPath: "gender")
                        print("WHITTEN GENDER: \(gender)")
                        if gender.value as? String == "Male" {
                        //print("This is the key\(key)")
                            print("YO WHITTEN: THIS PERSON IS A MALE!!")
                        
                        let leader = Leaderboard(userKey: key, leaderData: leaderDict)
                        
                        self.maleLeaders.append(leader)
                        } else {
                            print("YO WHITTEN: THIS IS A FEMALE!")
                            let leader2 = Leaderboard(userKey: key, leaderData: leaderDict)
                            self.femaleLeaders.append(leader2)
                        }
                        
                    }
                }
            }
            self.femaleLeaders.reverse()
            self.maleLeaders.reverse()
            self.leaderTV.reloadData()
        })
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var returnValue = 0
        
        switch (mySegment.selectedSegmentIndex) {
        case 0:
            returnValue = maleLeaders.count
            break
        case 1:
            returnValue = femaleLeaders.count
            break
            
        default:
            break
            
        }
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch (mySegment.selectedSegmentIndex) {
        case 0:
            let leader = maleLeaders[indexPath.row]
            performSegue(withIdentifier: "VideoVC", sender: leader)
            break
        case 1:
            let leader2 = femaleLeaders[indexPath.row]
            performSegue(withIdentifier: "VideoVC", sender: leader2)
            break
            
        default:
            break
            
        }

        
        
        
        //performSegue(withIdentifier: "VideoVC", sender: leader)
        print("You selected row #\(indexPath.row)!")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardsCell") as? LeaderboardsCell
            //cell.configureCell(leader: leader)
        
        switch (mySegment.selectedSegmentIndex) {
        case 0:
            let leader = maleLeaders[indexPath.row]
            cell!.configureCell(leader: leader)
            break
        case 1:
            let leader2 = femaleLeaders[indexPath.row]
            cell!.configureCell(leader: leader2)
            break
            
        default:
            break
            
        }

           return cell!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let video = sender as? Leaderboard {
                destination.videoLink = video
            }
            
        }
    }
    
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        
        leaderTV.reloadData()
        
    }
    
    
    


}
