//
//  SignUpVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/13/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper




class SignUpVC: UIViewController {

    @IBAction func repBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "RepSignUpVC", sender: nil)
        
    }
    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("WHITTEN: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("WHITTEN: User cancelled Facebook Authentication")
            } else {
                print("WHITTEN: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
   /* override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("WHITTEN: ID Found in KeyChain")
            performSegue(withIdentifier: "goToProfile", sender: nil)
        }
    }
    */
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("WHITTEN: Unable to authenticate with Firebase - \(error)")
            } else {
                print("WHITTEN: Successfully authenticated with Firebase")
                if let user = user {
                    let userData = ["prodivder": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, Any>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("WHITTEN: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToCreateProfile", sender: nil)
    }
   
    @IBAction func signInButtonPressed(_ sender: AnyObject){
        
        if let email = emailField.text, let pass = passwordField.text, (email.characters.count > 0 && pass.characters.count > 5){
           
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                if error == nil {
                    print("WHITTEN: Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID] as [String : Any]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                        if error != nil {
                            print("WHITTEN: Unable to Authenticate with Firebase using email")
                        } else {
                            print("WHITTEN: Successfully authenticated with Firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID] as [String : Any]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
    }
    
    }
    
    
    
    
    
    

}
