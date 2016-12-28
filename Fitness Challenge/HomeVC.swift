//
//  HomeVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/28/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UINavigationBarDelegate, UINavigationControllerDelegate {

    
   
    @IBOutlet weak var homeButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        homeButton.target = revealViewController()
        homeButton.action = #selector(SWRevealViewController.revealToggle(_:))
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
