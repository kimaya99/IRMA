//
//  ResultController2.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 2/17/18.
//  Copyright © 2018 SDSU. All rights reserved.
//

import UIKit

class ResultController2: UIViewController {

    @IBOutlet var reactionLabel2: UILabel!
    @IBOutlet var scoreLabel2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    var duration2 = (round(startTime - endTime)/100000000)
//    duration2 = duration2.truncate(places: 2)
        reactionLabel2.text = String(duration) + " secs"
    scoreLabel2.text = String(counter)+" / " + String(total)
    print(duration)
    print(total)
    }
}


