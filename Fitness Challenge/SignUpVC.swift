//
//  SignUpVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/13/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase




class SignUpVC: UIViewController {

    
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func signInButtonPressed(_ sender: AnyObject){
        
        if let email = emailField.text, let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 5){
            
            AuthService.instance.login(email: email, password: pass, onComplete: { (errMsg, data) in
               guard errMsg == nil else {
                let alert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                   self.present(alert, animated: true, completion: nil)
                print("Error Authenticating")
                   return
                }
                print("Sign in Worked")
                self.performSegue(withIdentifier: "goToCreateProfile", sender: nil)
                //self.dismiss(animated: true, completion: nil)
                
                
            })
            
        } else {
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    

    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
