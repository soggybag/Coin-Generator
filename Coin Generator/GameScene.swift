//
//  GameScene.swift
//  Coin Generator
//
//  Created by mitchell hudson on 7/16/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let coinSize = CGSize(width: 16, height: 16)
    var coinTextures = [SKTexture]()
    
    let coinBlock = [[1,1,0,0,0,1,1],
                     [1,1,1,0,1,1,1],
                     [1,1,1,1,1,1,1],
                     [1,1,0,1,0,1,1],
                     [1,1,0,0,0,1,1]]
    
    func makeCoin() -> SKNode {
        
        let coin = SKSpriteNode(color: UIColor.yellowColor(), size: coinSize)
        
        let animate = SKAction.animateWithTextures(coinTextures, timePerFrame: 0.2, resize: true, restore: false)
        let forever = SKAction.repeatActionForever(animate)
        coin.runAction(forever)
        
        return coin
    }
    
    func makeCoinBlock() -> SKNode {
        let coinNode = SKNode()
        for row in 0 ..< coinBlock.count {
            for col in 0 ..< coinBlock[row].count {
                if coinBlock[row][col] == 1 {
                    let coin = makeCoin()
                    coinNode.addChild(coin)
                    coin.position.x = CGFloat(col) * coinSize.width
                    coin.position.y = CGFloat(-row) * coinSize.height
                }
            }
        }
        
        return coinNode
    }
    
    override func didMoveToView(view: SKView) {
        for i in 1...5 {
            coinTextures.append(SKTexture(imageNamed: "Coin_\(i)"))
        }
        
        let block = makeCoinBlock()
        addChild(block)
        block.position.x = 100
        block.position.y = 300
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
