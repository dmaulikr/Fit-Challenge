//
//  HomeVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/28/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController, UINavigationBarDelegate, UINavigationControllerDelegate {

    
   
    @IBOutlet weak var challengesTV: UITableView!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Getting database references
        DataService.ds.REF_CHALLENGES.observe(.value, with: { (snapshot) in
            print(snapshot.value!)
        })

        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        homeButton.target = revealViewController()
        homeButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }

   

}
