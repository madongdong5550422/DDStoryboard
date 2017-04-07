//
//  DDSprite.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/30.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit

enum MoveDirection {
    case left
    case up
    case right
    case down
}

class DDSprite: SKSpriteNode {

    var animationInfos:[DDAnimationInfo] = []
    
    
    /// 精灵移动的动画
    var animationLeft   :SKAction?
    var animationUp     :SKAction?
    var animationRight  :SKAction?
    var animationDown   :SKAction?
    
    var animationDefault:SKAction?
    
    
    init(_animationInfos:[DDAnimationInfo], image:UIImage) {
        let firstTexture = SKTexture(image: image)
        super.init(texture:firstTexture, color: UIColor.gray, size: CGSize(width: 100, height: 60))
        animationInfos = _animationInfos
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playAnimation(animationName:String) {
        for animation in animationInfos {
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
    
    
    func playRunAnimation(velocity:CGVector) {
        let speed = sqrt(velocity.dx * velocity.dx + velocity.dy * velocity.dy)
        let moveDirection:MoveDirection
        
        if abs(velocity.dx) > abs(velocity.dy) {
            if velocity.dx > 0 {
                moveDirection = MoveDirection.right
            } else {
                moveDirection = MoveDirection.left
            }
        } else {
            if velocity.dy > 0 {
                moveDirection = MoveDirection.down
            } else {
                moveDirection = MoveDirection.up
            }
        }
        
        var animation:SKAction?
        switch moveDirection {
        case .right:
            animation = animationLeft
        case .up:
            animation = animationUp
        case .left:
            animation = animationLeft
        case .down:
            animation = animationDown
        default:
            animation = animationDefault
        }
        
        print(moveDirection)
        print(speed)
    }
    
}
