//
//  CreateUserViewController.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 11/29/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var emailAdressForLinking : String = ""

class CreateUserViewController: UITableViewController, UITextFieldDelegate {

    @IBAction func goBack(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainpage")
        self.present(newViewController, animated: true, completion: nil)
        
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        emailAddress.delegate = self
        fullName.delegate = self
        passWord.delegate = self
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (handleSelectProfileImage)))
        profileImage.isUserInteractionEnabled = true
    }
   
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }


    @IBAction func signUpButton(_ sender: AnyObject) {
       
        // empty email check
        guard let email = emailAddress.text, !email.isEmpty else {
            print("Email is empty");
            let alertController = UIAlertController(title: "Sign Up Error", message:
                "Please enter Email!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return }
        
        // empty password check
        guard let password = passWord.text, !password.isEmpty else {
            print("Password is empty");
            let alertController = UIAlertController(title: "Sign Up Error", message:
                "Please enter password!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return }
        
        // empty name check
        guard let name = fullName.text, !name.isEmpty else {
            print("Name is empty");
            let alertController = UIAlertController(title: "Sign Up Error", message:
                "Please enter Name!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return }
        
        // password length check
        guard let  passwordlen = passWord.text else{
            if ((passWord.text?.count)! < 6){
            let alertController = UIAlertController(title: "Sign Up Error", message:
                "Password length must be greater than 6", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            }
            
            else{
                print("Password OK")
            }
            return
            
        
        }
   
       
        let pass = password.trimmingCharacters(in: .whitespaces)
        let ref = Database.database().reference().root
        
        
        if email != "" && password != "" && name != "" {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                if error == nil {
                    
                    let storageRef = Storage.storage().reference().child(name+"-"+email+".png")
                    if let uploadData = UIImagePNGRepresentation(self.profileImage.image!)
                    {
                        storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                            if error != nil {
                                print(error)
                                let alertController = UIAlertController(title: "Sign Up Error", message:
                                    "Issue in uploading image", preferredStyle: UIAlertControllerStyle.alert)
                                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                                
                                self.present(alertController, animated: true, completion: nil)
                            }
                            print(metadata)
                        })
                    }
                    ref.child("users").child((user?.uid)!).setValue(email)
                    emailAdressForLinking = email
                   
           
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
                    self.present(newViewController, animated: true, completion: nil)
                }
                    
                    
                else{
                    if error != nil {
                        print(error!)
                        
                        if let errCode = AuthErrorCode(rawValue: error!._code) {
                            
                            switch errCode {
                            case .emailAlreadyInUse :
                                let alertController = UIAlertController(title: "Sign Up Error", message:
                                    "Email Already In Use", preferredStyle: UIAlertControllerStyle.alert)
                                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                                
                                self.present(alertController, animated: true, completion: nil)
                                
                                print("invalid email")
                                
                            case .weakPassword :
                                let alertController = UIAlertController(title: "Sign Up Error", message:
                                    "Weak Password", preferredStyle: UIAlertControllerStyle.alert)
                                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                                
                                self.present(alertController, animated: true, completion: nil)
                                
                                print("invalid email")
                                
                            case .invalidEmail :
                                let alertController = UIAlertController(title: "Sign Up Error", message:
                                    "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                                
                                self.present(alertController, animated: true, completion: nil)
                                
                                print("invalid email")
                                
                                
                            
                            default:
                                print("Create User Error: \(error)")
                            }
                        }
                       
                   
                    
                        
                    }
                }
            })
        
        
        }
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

