//
//  CreateChallengesVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/28/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class CreateChallengesVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UINavigationBarDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var homeButton2: UIBarButtonItem!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBAction func submitChallenge(_ sender: Any) {
        if let title = titleTF.text, let description = descriptionTextView.text, (title.characters.count > 0 && description.characters.count > 0) {
            DataService.ds.REF_CHALLENGES.childByAutoId().setValue(["title": title ,"description": description])
        
            
        } else {
            print("Must enter a title and a description!")
        }
        performSegue(withIdentifier: "goToHome", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        titleTF.delegate = self
      
        descriptionTextView.delegate = self
        
        revealViewController().rearViewRevealWidth = 200
        homeButton2.target = revealViewController()
        homeButton2.action = #selector(SWRevealViewController.revealToggle(_:))

        
        
    }
    
    func dismissKeyboard() {
    view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTF.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        descriptionTextView.resignFirstResponder()
         
        return true
    }
    
    func completeChallenge(id: String, challengeData: Dictionary<String, String>) {
        DataService.ds.createChallenge(challengeID: id, challengeData: challengeData)
        performSegue(withIdentifier: "goToHome", sender: nil)
    }

    
    
    

    
}
