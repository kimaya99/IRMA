//
//  ViewController.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 11/27/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UITableViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var emailAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpFacebookButtons()
//      setUpGoogleButtons()
    }
    
    @IBAction func goBack2(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainpage")
        self.present(newViewController, animated: true, completion: nil)
    }

    @IBAction func logIn(_ sender: AnyObject) {
        
        guard let email = emailAddress.text, let password = password.text else {return}
        
        guard let emailer = emailAddress.text, !emailer.isEmpty else {
            print("Email is empty");
            let alertController = UIAlertController(title: "Sign Up Error", message:
                "Please enter Email!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return }
        
       
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
               
                if error != nil {
                    print(error)
                    
                    if let errCode = AuthErrorCode(rawValue: error._code) {
                        
                        switch errCode {
                       
                            
                        case .invalidEmail :
                            let alertController = UIAlertController(title: "Sign In Error", message:
                                "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            print("invalid email")
                            
                        case .wrongPassword :
                            let alertController = UIAlertController(title: "Sign In Error", message:
                                "Wrong Password", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            
                            
                            
                        default:
                            print("Logging User Error: \(error)")
                        }
                    }
                }
                let alertController = UIAlertController(title: "Sign In Error", message:
                    "Entry not present in Database", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                }
                
                
        else if let user = Auth.auth().currentUser {
                emailAdressForLinking = email
                self.goToLoginView()
            }
        }
    }
    
    func goToLoginView(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "GatewayViewController")
        self.present(newViewController, animated: true, completion: nil)
    }
   
    fileprivate func setUpFacebookButtons(){

        let customFBButton = UIButton(type: .system )
        customFBButton.backgroundColor = .blue
        customFBButton.frame = CGRect(x: 150, y: 300, width: view.frame.width-300, height: 60)
       
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.addTarget(self, action: #selector(handleCustomFBSign), for: .touchUpInside)
        customFBButton.setBackgroundImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        view.addSubview(customFBButton)

    }

    @objc func handleCustomFBSign(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, err) in
            if err != nil {
                print("Custom FB Login Failed",err ?? "")
                return
            }
        self.showEmailAddress()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController")
            self.present(newViewController, animated: true, completion: nil)
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did Log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        showEmailAddress()
        print("Successfully logged in with facebook...")
        
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func showEmailAddress(){
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return}
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials) { (user, error) in
            if error != nil {
                print("Failed to create Firebase user with FB account",error ?? "" )
                return
            }
            guard let uid = user?.uid else {return}
            print("Successfully logged into firebase",uid)
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email"]).start { (connection, result, err) in
            print(123)
            
        if err != nil{
            print("Failed to start graph request",err ?? "")
            return
        }
        print(result ?? "")
        }
    }
}



