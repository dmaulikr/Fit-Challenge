//
//  CreateProfileVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/3/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase

class CreateProfileVC: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var bioTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
    
    @IBAction func applyBtnPressed(_ sender: Any) {
    
    let currentUser = FIRAuth!.auth()!.uid
    DataService.ds.REF_USERS.child(currentUser).child("profile").setValue(["title": title ,"description": description])
        
        

  
    
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let username = usernameTF.text
        let bio = bioTF.text
        let name = nameTF.text
        let age = ageTF.text
        let gender = genderTF.text
        let weight = weightTF.text
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToProfile" {
            let destination = segue.destination as! ProfileVC
            
            
            let username = self.username
            let bio = self.bio
            let name = self.name
            let age = self.age
            let gender = self.gender
            let weight = self.weight
            
            destination.username = username
            destination.bio = bio
            destination.name = name
            destination.age = age
            destiantion.gender = gender
            destination.weight = weight
            
            
            
            
            //destination.viaSegue =
            
            
        }
    }


}
