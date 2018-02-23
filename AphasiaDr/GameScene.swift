//
//  GameScene.swift
//  AphasiaDrill
//
//  Created by Kimaya Desai on 12/13/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var passingTexture = ""

class GameScene: SKScene {
    
    var MainMotion = SKSpriteNode()
    var TextureAtlas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    
    var MainMotion2 = SKSpriteNode()
    var TextureAtlas2 = SKTextureAtlas()
    var TextureArray2 = [SKTexture]()
    
    var MainMotion3 = SKSpriteNode()
    var TextureAtlas3 = SKTextureAtlas()
    var TextureArray3 = [SKTexture]()
    
    override func didMove(to view: SKView) {
        
        if (checkController == 1){
            TextureAtlas = SKTextureAtlas(named: "Flanker")
        
            for i in 1...TextureAtlas.textureNames.count{
                let Name = "flanker_\(i).jpg"
                TextureArray.append(SKTexture(imageNamed: Name))
            }
        
            MainMotion = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0])
        
            MainMotion.size = CGSize(width:500, height:600)
            MainMotion.position = CGPoint(x: 0, y : 0)
            self.addChild(MainMotion)
            passingTexture = String(describing: MainMotion.texture)
        }
            
        else if (checkController == 2){
                TextureAtlas2 = SKTextureAtlas(named: "stroop")
            
                for i in 1...TextureAtlas2.textureNames.count{
                    let Name = "win_\(i).jpg"
                    TextureArray2.append(SKTexture(imageNamed: Name))
                }
            
            MainMotion2 = SKSpriteNode(imageNamed: TextureAtlas2.textureNames[0])
            
            MainMotion2.size = CGSize(width:500, height:600)
            MainMotion2.position = CGPoint(x: 0, y : 0)
            self.addChild(MainMotion2)
            passingTexture = String(describing: MainMotion2.texture)
        }
        
        else {
            TextureAtlas3 = SKTextureAtlas(named: "rprobes")
            
            for i in 1...TextureAtlas3.textureNames.count{
                let Name = "rprobe_\(i).jpg"
                TextureArray3.append(SKTexture(imageNamed: Name))
            }
            
            MainMotion3 = SKSpriteNode(imageNamed: TextureAtlas3.textureNames[0] )
            
            MainMotion3.size = CGSize(width:500, height:600)
            MainMotion3.position = CGPoint(x: 0, y : 0)
            self.addChild(MainMotion3)
            passingTexture = String(describing: MainMotion3.texture)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (checkController == 1){
            MainMotion.run(SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 1.0)))
        }
        else if (checkController == 2){
            MainMotion2.run(SKAction.repeatForever(SKAction.animate(with: TextureArray2, timePerFrame: 1.0)))
        }
        else{
            MainMotion3.run(SKAction.repeatForever(SKAction.animate(with: TextureArray3, timePerFrame: 1.0)))
        }
    }
}


