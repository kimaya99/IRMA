//
//  DashboardViewController.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 12/17/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import Firebase
var k = ""
var w = ""
var p = ""

class DashboardViewController: UIViewController {

    @IBAction func restart(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "instructions")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func exitCalled(_ sender: Any) {
        exit(0);
    }
 
    @IBOutlet var totallr: UILabel!
    @IBOutlet var timeLabel: UILabel!

    @IBOutlet var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard let sco = score else{
            return
        }
        sco.text = String(counter)
        p =  sco.text!
        
        totallr.text = String(total)
        k = totallr.text!
        var duration = (round(startTime - endTime)/100000000)
        duration = duration.truncate(places: 2)
        timeLabel.text = String(duration)
        w = timeLabel.text!
        let scorem : [String:String] = [ "identity" : emailAdressForLinking,"marks" : p, "total" : k, "time" : w]
        
        let ref = Database.database().reference()
        let key = ref.child("Score").childByAutoId().setValue(scorem)
        
    }

   
    
}


