//
//  DDAnimationMenuDelegate.swift
//  DDStoryboard
//
//  Created by madongdong on 2017/4/3.
//  Copyright © 2017年 1 1. All rights reserved.
//

import Foundation
import SpriteKit
protocol DDAnimationMenuDelegate {
    func numberOfAnimations() -> NSInteger
    func animationNode(index:NSInteger) -> SKNode
}
