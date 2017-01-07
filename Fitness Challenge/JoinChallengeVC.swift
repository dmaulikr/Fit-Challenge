//
//  JoinChallengeVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/1/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import UIKit
import Firebase
import AVKit
import MediaPlayer
import MobileCoreServices


class JoinChallengeVC: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var videoLink: UITextField!
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var repAmount: UITextField!
    
 
    
    
    
    var challengeID: String!
    var challengeTitle = ""
    var challengeDescription = ""
    var challengeKey = ""
    var userEnteredList = [String]()
    var userName = String()
    
    @IBAction func recordBtnPressed(_ sender: AnyObject) {
        
        startCameraFromViewController(viewController: self, withDelegate: self)
        
        
        
        
        
    }
    
    
    
    @IBAction func submitPressed(_ sender: Any) {
        if let video = videoLink.text, let reps = repAmount.text,(video.characters.count > 0 && reps.characters.count > 0) {
            let currentUser = FIRAuth.auth()!.currentUser!.uid
            DataService.ds.REF_CHALLENGES.child(self.challengeKey).child("joinedChallenger").child(currentUser).setValue(["reps": reps, "videoLink": video])
            DataService.ds.REF_LEADERBOARDS.child(self.challengeKey).child(currentUser).setValue(["reps": reps,"userName": userNameLbl.text, "videoLink": video])
            let alertController = UIAlertController(title: "Entry Submitted", message:"You are now entered into the \(challengeTitle)!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
                print("You've pressed OK button")
                self.performSegue(withIdentifier: "backToHome", sender: nil);
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        
            } else {
            let alertController2 = UIAlertController(title: "ERROR", message:"You must enter a valid video link and rep amount", preferredStyle: .alert)
            let OKAction2 = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
                print("You've pressed OK button");
                
            }
            alertController2.addAction(OKAction2)
            self.present(alertController2, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLeaderboards" {
            let destination = segue.destination as! LeaderboardsVC
           
            let challengeTitle = self.challengeTitle
            let challengeDescription = self.challengeDescription
            let challengeKey = self.challengeKey
            
            destination.challengeTitle = challengeTitle
            destination.challengeDescription = challengeDescription
            destination.challengeKey = challengeKey
            
            
            
            
            //destination.viaSegue =
            
            
        }
    }

    


        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        repAmount.resignFirstResponder()
        videoLink.resignFirstResponder()
        return true
    }

           
    func dismissKeyboard() {
        view.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
         self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(JoinChallengeVC.dismissKeyboard)))
        let currentUser = FIRAuth.auth()!.currentUser!.uid
        DataService.ds.REF_CHALLENGES.child(self.challengeKey).child("joinedChallenger").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            
            //print(snapshot)
            //if snapshot.hasChild(currentUser) {
               // self.ifUserAlreadyJoined()
            //} else {
              //  print("User hasn't joined yet")
            //}
            //self.ifUserAlreadyJoined()
            //self.challenges = [] //clears out challenges array at the beginning of listener
            
            //print(snapshot.value!)
            //if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
            //for snap in snapshot {
            // print("SNAP: \(snap)")
            //if let challengeDict = snap.value as? Dictionary<String, AnyObject> {
            //let key = snap.key
            
            //}
            //}
            //} else {
            /*print("WHITTEN: User has already entered!")
             let alertController2 = UIAlertController(title: "ERROR", message:"User has already entered!", preferredStyle: .alert)
             let OKAction2 = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
             print("You've pressed OK button");
             
             }
             alertController2.addAction(OKAction2)
             self.present(alertController2, animated: true, completion: nil)
             
             }*/
        })
        
        DataService.ds.REF_USERS.child(currentUser).child("profile").observeSingleEvent(of: .value, with: { (snaps) in
            if let dictionary = snaps.value as? [String: AnyObject] {
                self.userNameLbl.text = dictionary["userName"] as? String
            }
            
            
        }, withCancel: nil)
        
        
    }
    

    func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        var title = "Success"
        var message = "Video was saved"
        if let _ = error {
            title = "Error"
            message = "Video failed to save"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    

    
    func ifUserAlreadyJoined() {
        //let currentUser = FIRAuth.auth()!.currentUser!.uid
        //if DataService.ds.REF_CHALLENGES.child("joinedChallenger").key == currentUser {
            let alertController1: UIAlertController = UIAlertController(title: "WARNING", message: "You have already entered, entering again will delete your last entry!", preferredStyle: .actionSheet)
            let continueAction: UIAlertAction = UIAlertAction(title: "Continue", style: .default) { action -> Void in
                
            }
            alertController1.addAction(continueAction)
            let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void  in
                //self.performSegue(withIdentifier: "backHome", sender: nil)
            }
            alertController1.addAction(cancelAction)
            
            self.present(alertController1, animated: true, completion: nil)
            

   // }
    }
  
    func startCameraFromViewController(viewController: UIViewController, withDelegate delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
            return false
        }
        
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.mediaTypes = [kUTTypeMovie as NSString as String]
        cameraController.allowsEditing = false
        cameraController.delegate = delegate
        
        present(cameraController, animated: true, completion: nil)
        return true
    }
    
    
    
    
    
    

}

extension JoinChallengeVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        dismiss(animated: true, completion: nil)
        // Handle a movie capture
        if mediaType == kUTTypeMovie {
            guard let path = (info[UIImagePickerControllerMediaURL] as! NSURL).path else { return }
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path) {
                UISaveVideoAtPathToSavedPhotosAlbum(path, self, #selector(JoinChallengeVC.video(videoPath:didFinishSavingWithError:contextInfo:)), nil)
                
            }
        }
    }

}








