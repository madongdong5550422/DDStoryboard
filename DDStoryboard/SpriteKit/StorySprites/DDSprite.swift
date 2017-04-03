//
//  DDSprite.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/30.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit

class DDSprite: SKSpriteNode, DDAnimationMenuDelegate {

    var animations:[DDAnimationInfo] = []
    var animationMenu:DDAnimationMenuNode?
    
    
    init(animationInfos:[DDAnimationInfo], image:UIImage) {
        let firstTexture = SKTexture(image: image)
        super.init(texture:firstTexture, color: UIColor.gray, size: CGSize(width: 100, height: 60))
        animations = animationInfos
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playAnimation(animationName:String) {
        for animation in animations {
            if animation.name == animationName {
                playAnimation(animation: animation)
            }
        }
    }
    
    func playAnimation(animation:DDAnimationInfo) {
        // 播放动画
        var frames = [SKTexture]()
        for image in animation.images {
            let frame = SKTexture(image: image)
            frames.append(frame)
        }
        
        let oneAnimation = SKAction.animate(with: frames, timePerFrame: TimeInterval(animation.frameInterval))
        
        var repeatAnimation:SKAction?
        if animation.loopCount == 0 {
            repeatAnimation = SKAction.repeatForever(oneAnimation)
        } else {
            repeatAnimation = SKAction.repeat(oneAnimation, count: animation.loopCount)
        }
        self.run(repeatAnimation!)
    }
    
    func showAnimationsMenu() {
        if animationMenu == nil {
            animationMenu = DDAnimationMenuNode()
            animationMenu?.delegate = self
            addChild(animationMenu!)
        }
        animationMenu?.reloadData()
    }
    
    func numberOfAnimations() -> NSInteger {
        return 3
    }
    
    func animationNode(index:NSInteger) -> SKNode {
        let cellNode = SKSpriteNode(imageNamed: "cat")
        return cellNode
    }
    
}
