//
//  Tasks.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 11/29/17.
//  Copyright © 2017 SDSU. All rights reserved.
//  Collection View Attempt 

import Foundation
import UIKit
class Tasks {
// MARK: - Public API

    var label: String
    var featuredImage: UIImage
var color: UIColor

    init( label: String, featuredImage: UIImage, color: UIColor)
{
    self.label = label
    self.featuredImage = featuredImage
    self.color = color

}

// MARK: - Private
// dummy data
static func fetchTasks() -> [Tasks]
{
    return [
        Tasks(label:"FLANKER", featuredImage: UIImage(named: "carousel1")!, color: UIColor(red: 200.0/255.0, green: 200/255.0, blue: 0/255.0, alpha: 0.8)),
        Tasks(label:"STROOP",featuredImage: UIImage(named: "carousel2")!, color: UIColor(red: 0/255.0, green: 200/255.0, blue: 200/255.0, alpha: 0.8)),
  
        
    ]
}
}

