//
//  DDAnimationMenuNode.swift
//  DDStoryboard
//
//  Created by madongdong on 2017/4/3.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit

class DDAnimationMenuNode: SKNode {
    var delegate:DDAnimationMenuDelegate?
    func reloadData() {
        if delegate == nil {
            print("animationMenuNode 代理未设置")
            return;
        }
        let count = delegate?.numberOfAnimations()
        for index in 0...Int(count!) {
            print(index)
            let cellNode = delegate?.animationNode(index: index)
            print("dongdongdongdong")
            print(cellNode!)
            addChild(cellNode!)
            print("testtest")
        }
        
    }
}