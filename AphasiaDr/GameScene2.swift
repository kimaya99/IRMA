//
//  GameScene2.swift
//  AphasiaDr
//
//  Created by Kimaya Desai on 2/17/18.
//  Copyright © 2018 SDSU. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class GameScene2: SKScene {
    
    var MainMotion2 = SKSpriteNode()
    var TextureAtlas2 = SKTextureAtlas()
    var TextureArray2 = [SKTexture]()

    
    
    override func didMove(to view: SKView) {
        
        TextureAtlas2 = SKTextureAtlas(named: "Flanker")
        
        //_ = TextureAtlas2.textureNames.count
        for i in 1...TextureAtlas2.textureNames.count{
            let Name = "flanker_\(i).jpg"
            TextureArray2.append(SKTexture(imageNamed: Name))
        }
        MainMotion2 = SKSpriteNode(imageNamed: TextureAtlas2.textureNames[0] )
        
        MainMotion2.size = CGSize(width:400, height:400)
        MainMotion2.position = CGPoint(x: 0, y : 0)
        self.addChild(MainMotion2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MainMotion2.run(SKAction.repeatForever(SKAction.animate(with: TextureArray2, timePerFrame: 0.5)))
    }
}


