//
//  StroopViewController.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 2/17/18.
//  Copyright © 2018 SDSU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreFoundation

var startTime2:CFAbsoluteTime = 0
var endTime2:CFAbsoluteTime = 0

var checkController = 2
var dictionary2: [String:String] = ["" : ""]
var counter2 = 0
var total2 = 0
var duration2 = 0
var ansDictionary2: [String:String] = [
    "Optional(<SKTexture> \'win_1.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_2.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_3.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_4.jpg\' (1080 x 1080))" : "right",
    "Optional(<SKTexture> \'win_5.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_6.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_7.jpg\' (1080 x 1080))" : "right",
    "Optional(<SKTexture> \'win_8.jpg\' (1080 x 1080))" : "right",
    "Optional(<SKTexture> \'win_9.jpg\' (1080 x 1080))" : "left",
    "Optional(<SKTexture> \'win_10.jpg\' (1080 x 1080))" : "left"
    ]

class StroopViewController: UIViewController {

    @IBOutlet var rightLabel: UIButton!
    @IBOutlet var leftLabel: UIButton!
    @IBOutlet var stopLabel: UIButton!
    
    
     @IBOutlet var startLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stopLabel.isHidden = true
        rightLabel.isHidden = true
        leftLabel.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.black
    }
    @IBAction func startPressed(_ sender: Any) {
        counter = 0
        total = 0
        
        if let view = self.view as! SKView? {
            checkController = 2
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
        rightLabel.isHidden = false
        leftLabel.isHidden = false
        print(startTime)
    }
    
    
    
    @IBAction func stopNow(_ sender: Any) {
        endTime = CFAbsoluteTimeGetCurrent()
    }
    
    
    @IBAction func leftPressed(_ sender: AnyObject) {
        
    dictionary.updateValue("left", forKey: passingTexture)
    var image = passingTexture
        total = total + 1
        for x in ansDictionary {
         if x.value == "left" {
                 if x.key == image{
                    print("Correct Ans - left")
                    counter = counter + 1
                    print(counter)
                }
            }
        }
  
    }
    
    @IBAction func rightPressed(_ sender: AnyObject) {
        
      dictionary.updateValue("right", forKey: passingTexture)
        
    var image = passingTexture
        total = total + 1
        for x in ansDictionary {
            if x.value == "right" {
               if x.key == image{
                    print("Correct Ans - right")
                    counter = counter + 1
                    print(counter)
                }
            }
        }
        
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
