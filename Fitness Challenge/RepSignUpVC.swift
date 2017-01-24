//
//  RepSignUpVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/22/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class RepSignUpVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    
    @IBAction func backToSignUpVC(_ sender: Any) {
        
        performSegue(withIdentifier: "backToSignUpVC", sender: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if let email = emailTF.text, let pass = passwordTF.text, let company = companyTF.text, (email.characters.count > 0 && pass.characters.count > 5 && company.characters.count > 0){
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                if error == nil {
                    print("WHITTEN: Email user authenticated with Frebase")
                    if let user = user {
                        let userData = ["provider": user.providerID, "isAdmin": true] as [String : Any]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                        if error != nil {
                            print("WHITTEN: Unable to Authenticate with Firebase using email")
                        } else {
                            print("WHITTEN: Successfully authenticated with Firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID, "isAdmin": true] as [String : Any]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }

        
    }
    
  
        
    
    func completeSignIn(id: String, userData: Dictionary<String, Any>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("WHITTEN: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "repGoToProfile", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("WHITTEN: ID Found in KeyChain")
           performSegue(withIdentifier: "repGoToProfile", sender: nil)
        }
    }

   

}
