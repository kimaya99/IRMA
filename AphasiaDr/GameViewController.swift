//
//  GameViewController.swift
//  Aphasia
//
//  Created by Kimaya Desai on 12/1/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreFoundation

var startTime:CFAbsoluteTime = 0
var endTime:CFAbsoluteTime = 0

var dictionary: [String:String] = ["" : ""]
var counter = 0
var total = 0
var duration = 0
var ansDictionary: [String:String] = [
    "Optional(<SKTexture> \'flanker_1.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'flanker_2.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'flanker_3.jpg\' (1080 x 1080))" : "right"
   
]

class GameViewController: UIViewController {
    @IBOutlet var startLabel: UIButton!
    @IBOutlet var rightLabel: UIButton!
    @IBOutlet var leftLabel: UIButton!
    @IBOutlet var stopLabel: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        stopLabel.isHidden = true
        rightLabel.isHidden = true
        leftLabel.isHidden = true
    }
    
    
    @IBAction func startPressed(_ sender: Any) {
        counter = 0
        total = 0
        checkController = 1
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "GameScene"){
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
     
       
        
        startTime = CFAbsoluteTimeGetCurrent()
        
        self.startLabel.isHidden = true
        self.stopLabel.isHidden = false
        self.rightLabel.isHidden = false
        self.leftLabel.isHidden = false
    
    }
    
  
    
    @IBAction func stopNow(_ sender: Any) {
        
        endTime = CFAbsoluteTimeGetCurrent()
    }
    
    @IBAction func leftPressed(_ sender: AnyObject) {
        
     //   dictionary.updateValue("left", forKey: String(describing: MainMotion.texture))
    //    var image = String(describing: MainMotion.texture)
        total = total + 1
        
        for x in ansDictionary {
            
            if x.value == "left" {
                
         /*       if x.key == image{
                    print("Correct Ans - left")
                    counter = counter + 1
                    print(counter)
                } */
            }
        }
        
        UIView.animate(withDuration: 1.0,
                       animations: {
                        self.leftLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)},
                       
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.leftLabel.transform = CGAffineTransform.identity
                            
                            self.leftLabel.showsTouchWhenHighlighted = true
                        }
        })
    }
    
    @IBAction func rightPressed(_ sender: AnyObject) {
        
     //   dictionary.updateValue("right", forKey: String(describing: MainMotion.texture))
    //    var image = String(describing: MainMotion.texture)
        total = total + 1
        
        for x in ansDictionary {
            
            if x.value == "right" {
                
          /*      if x.key == image{
                    print("Correct Ans - right")
                    counter = counter + 1
                    print(counter)
                } */
            }
        }
        
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.rightLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.rightLabel.transform = CGAffineTransform.identity
                            
                            self.rightLabel.showsTouchWhenHighlighted = true
                        }
        })
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
}


