//
//  GameScene.swift
//  Coin Generator
//
//  Created by mitchell hudson on 7/16/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//



/*
    Generate coins in shaped blocks. Define a block as a nested array. 
    Think of the this array as describing the position of coins in 
    rows and columns. A 1 in the columns array places a coin, while a
    0 means no coin. 
 
    Coins are animated with a array textures from the coin.atlas. 
 
*/




import SpriteKit

class GameScene: SKScene {
    
    var redBox: SKSpriteNode!
    
    // Define the size for coins.
    let coinSize = CGSize(width: 16, height: 16)
    // Define an array of textures. This is filled with text s in didMoveToView.
    var coinTextures = [SKTexture]()
    
    // Define a block of coins. This block creates the letter M.
    let coinBlock = [[1,1,0,0,0,1,1],
                     [1,1,1,0,1,1,1],
                     [1,1,1,1,1,1,1],
                     [1,1,0,1,0,1,1],
                     [1,1,0,0,0,1,1]]
    
    
    // A utility to shift elements in the textures array by one.
    func shift(inout array:[SKTexture]) {
        array.append(array.removeFirst())
    }
    
    // Make a coin. we'll call this each time we need a coin.
    func makeCoin() -> SKNode {
        let coin = SKSpriteNode(color: UIColor.yellowColor(), size: coinSize)
        
        let animate = SKAction.animateWithTextures(coinTextures, timePerFrame: 0.2, resize: true, restore: false)
        let forever = SKAction.repeatActionForever(animate)
        coin.runAction(forever)
        
        shift(&coinTextures)
        
        return coin
    }
    
    // Make a block of coins. This returns a node containing all coins.
    func makeCoinBlock() -> SKNode {
        let coinNode = SKNode()
        for row in 0 ..< coinBlock.count {
            for col in 0 ..< coinBlock[row].count {
                if coinBlock[row][col] == 1 {
                    let coin = makeCoin()
                    coinNode.addChild(coin)
                    coin.position.x = CGFloat(col) * coinSize.width
                    // Row needs to be inverted!
                    coin.position.y = CGFloat(-row) * coinSize.height
                }
            }
        }
        
        return coinNode
    }
    
    override func didMoveToView(view: SKView) {
        
        redBox = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 40, height: 40))
        addChild(redBox)
        redBox.position.x = 200
        redBox.position.y = 400
        
        // Setup the textures array.
        for i in 1...5 {
            coinTextures.append(SKTexture(imageNamed: "Coin_\(i)"))
        }
        
        // Make a block of coins.
        let block = makeCoinBlock()
        // Add and position block of coins.
        addChild(block)
        block.position.x = 100
        block.position.y = 300
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
}




