//
//  AuthService.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/19/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { user, error in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { user,error in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                
                            } else {
                                if user?.uid != nil {
                                    
                                    DataService.instance.saveUser(uid: user!.uid)
                                    
                                    //Sign In
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other erros
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                //Successfully Logged In
                onComplete?(nil, user)
                print("Logged in Successfully")
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
        switch (errorCode) {
        case .errorCodeInvalidEmail:
            onComplete?("Invalid email addresss", nil)
            break
        case .errorCodeWrongPassword:
            onComplete?("Invalid Password", nil)
            break
        case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
            onComplete?("Could not create account. Email already in use", nil)
            break
            
        default:
            onComplete?("There was a problem authenticating", nil)
        }
      }
    }
}
