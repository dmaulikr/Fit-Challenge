//
//  MenuVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/27/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tblTableView: UITableView!
    var menuNameArr: Array = [String]()
    var iconImageArr: Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArr = ["Home","Profile","Challenges", "Messages"]
        iconImageArr = [UIImage(named: "Home" )!, UIImage(named: "Profile")!, UIImage(named: "Challenges")!, UIImage(named: "Messages")!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuNameArr.count
        
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVC", for: indexPath) as! MenuTVC
        cell.iconMenu.image = iconImageArr[indexPath.row]
        cell.lblMenu.text! = menuNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        
        let cell: MenuTVC = tableView.cellForRow(at: indexPath) as! MenuTVC
        print(cell.lblMenu.text!)
        
        if cell.lblMenu.text! == "Home" {
            print("Home Tapped")
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.lblMenu.text! == "Profile" {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "CreateProfileVC") as! CreateProfileVC
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.lblMenu.text! == "Messages" {
            print("Messages Tapped")
        }
        
        if cell.lblMenu.text! == "Challenges" {
            print("Challenges Tapped")
        }
        
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
