//
//  StoryboardScene.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/29.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit

class StoryboardScene: SKScene {
    
    var dragingNode:DDSprite? = nil
    
    override func didMove(to view: SKView) {
        setUpScenery()
        setUpSprites()
//        拖动精灵的手势
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(sender:)))
        view.addGestureRecognizer(panGesture)
        
//        添加点击手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(sender:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func setUpScenery() {
        let backgroundNode = SKSpriteNode(imageNamed: "Background")
        backgroundNode.anchorPoint = CGPoint(x: 0, y: 0)
        backgroundNode.position = CGPoint(x: 0, y: 0)
        backgroundNode.size = size
        addChild(backgroundNode)
    }
    
    fileprivate func setUpSprites() {
        let images:[UIImage] = [#imageLiteral(resourceName: "bear1"),#imageLiteral(resourceName: "bear2"),#imageLiteral(resourceName: "bear3"),#imageLiteral(resourceName: "bear4"),#imageLiteral(resourceName: "bear5"),#imageLiteral(resourceName: "bear6"),#imageLiteral(resourceName: "bear7"),#imageLiteral(resourceName: "bear8")]
        let bearAnimationInfo = DDAnimationInfo(name: "run", images:images, loopCount: 0, frameInterval: 0.1)
        let bearSprite = DDSprite(animationInfos: [bearAnimationInfo], image: #imageLiteral(resourceName: "bear1"))
        addChild(bearSprite)
        bearSprite.position = CGPoint(x: 300, y: 100)
        bearSprite.playAnimation(animationName: "run")
        bearSprite.zPosition = 1;
    }
    
    func handleTapGesture(sender:UITapGestureRecognizer) {
        print("tap tap tap")
    }
    
    func handlePanGesture(sender:UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            let locate = sender.location(in: sender.view)
            let transLoc = convertPoint(fromView: locate)
            dragingNode = getSpriteNode(position: transLoc)
            print("拖动开始")
        case .changed:
            if (dragingNode == nil) {
                return
            }
            let transPos = sender.translation(in: sender.view)
            let moveAction = SKAction.moveBy(x: transPos.x, y: -transPos.y, duration: 0)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            dragingNode?.run(moveAction)
            dragingNode?.playRunAnimation(velocity: CGVector(dx: transPos.x, dy: transPos.y))

            
        case .ended:
            var moveByVec = sender.velocity(in: sender.view) * 0.05
            moveByVec.y *= -1.0
            let slowAction = SKAction.move(by: convertToVector(point: moveByVec), duration: 0.2)
            slowAction.timingMode = SKActionTimingMode.easeOut
            dragingNode?.run(slowAction)
            dragingNode = nil
        default: break
            
        }
    }
    
    
    /// 从场景中获取精灵
    ///
    /// - Parameter position: 位置
    /// - Returns: 获取到的精灵，可能为空
    fileprivate func getSpriteNode(position:CGPoint) -> DDSprite? {
        let node = atPoint(position)
        if node.isKind(of: DDSprite.self) {
            return node as? DDSprite
        } else {
            return nil
        }
    }
    
}
