//
//  CreateChallengesVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/28/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class CreateChallengesVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UINavigationBarDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var homeButton2: UIBarButtonItem!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
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
    

    
}
