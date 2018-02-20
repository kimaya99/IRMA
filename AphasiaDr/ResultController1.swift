//
//  ResultController1.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 2/17/18.
//  Copyright © 2018 SDSU. All rights reserved.
//

import UIKit
import Firebase
class ResultController1: UIViewController{

 
  
    @IBOutlet var reactionLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var duration = (round(startTime - endTime)/100000000)
        duration = duration.truncate(places: 2)
        reactionLabel.text = String(duration) + " secs"
        scoreLabel.text = String(counter)+" / " + String(total)
      print(duration)
        print(total)

    }

    
}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
