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

    var leaders = [Leaderboard]()
    var users = [Leaderboard]()
    
    var challengeTitle = ""
    var challengeDescription = ""
    var challengeKey = ""
    var userName = String()
    
    
    
    @IBOutlet var leaderTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //parseUserNames()
        //leaders.reverse()
        
        leaderTV.delegate = self
        leaderTV.dataSource = self
        
        //let currentUser = FIRAuth.auth()!.currentUser!.uid
        let query = DataService.ds.REF_LEADERBOARDS.child(self.challengeKey).queryOrdered(byChild: "reps").queryLimited(toLast: 10)
        query.observe(.value, with: { (snapshot) in
            
            self.leaders = []
            
           // print("WHITTEN: \(snapshot)")
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let leaderDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        //print("This is the key\(key)")
                        let leader = Leaderboard(userKey: key, leaderData: leaderDict)

                        self.leaders.append(leader)
                    }
                }
            }
            self.leaders.reverse()
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
        return leaders.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row #\(indexPath.row)!")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leader = leaders[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardsCell") as? LeaderboardsCell {
            cell.configureCell(leader: leader)
            
            return cell
        } else {
            return LeaderboardsCell()
        }
        
    }
    
    func parseUserNames() {
        let query = DataService.ds.REF_USERS.queryOrdered(byChild: "userName").queryLimited(toLast: 10)
        query.observe(.value, with: { (snapshot) in
            
            self.users = []
            
            print("WHITTEN: \(snapshot)")
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let userDict = snap.value as? Dictionary<String, AnyObject> {
                        let userName = userDict["userName"] as? String
                    }
                }
            }
            self.users.reverse()
            self.leaderTV.reloadData()
        })

        
        
    }
    
    


}
