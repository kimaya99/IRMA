//
//  RecentProbeViewController.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 2/20/18.
//  Copyright © 2018 SDSU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreFoundation

var dictionary3: [String:String] = ["" : ""]
var counter3 = 0
var total3 = 0
var duration3 = 0
var ansDictionary3: [String:String] = [
    "Optional(<SKTexture> \'flanker_1.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'flanker_2.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'flanker_3.jpg\' (1080 x 1080))" : "right"
    
]

class RecentProbeViewController: UIViewController {
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var stopLabel: UIButton!
    @IBOutlet var startLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopLabel.isHidden = true
        yesButton.isHidden = true
        noButton.isHidden = true
    }

    @IBAction func startPressed(_ sender: Any) {
        counter = 0
        total = 0
        
        if let view = self.view as! SKView? {
            checkController = 3
            if let scene = SKScene(fileNamed: "GameScene"){
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        //SKAction.animate(with: SKTextureAtlas(named: "stroops"), timePerFrame: 1.0)
        //      MainMotion2.run(SKAction.animate(with: TextureArray2, timePerFrame: 1.0))
        
        
        startTime = CFAbsoluteTimeGetCurrent()
        
        self.startLabel.isHidden = true
        self.stopLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false
        print(startTime)
    }
    
    @IBAction func stopPressed(_ sender: Any) {
    }
    
    @IBAction func yesPressed(_ sender: Any) {
    }
    
    
    @IBAction func noPressed(_ sender: Any) {
    }
}
