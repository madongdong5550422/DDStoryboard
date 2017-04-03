//
//  DDAnimationMenuCellNode.swift
//  DDStoryboard
//
//  Created by madongdong on 2017/4/3.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit

class DDAnimationMenuCellNode: SKSpriteNode {
    
    var animationInfo:DDAnimationInfo?
    
    func set(animation:DDAnimationInfo) {
        animationInfo = animation;
        playAnimation(animation: animationInfo!)
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
        repeatAnimation = SKAction.repeatForever(oneAnimation)
        self.run(repeatAnimation!)
    }
    
}
