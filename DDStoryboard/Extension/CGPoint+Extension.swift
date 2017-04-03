//
//  CGPoint+Extension.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/30.
//  Copyright © 2017年 1 1. All rights reserved.
//

import Foundation
import UIKit

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

public func += ( left: inout CGPoint, right: CGPoint) {
    left = left + right
}

public func * (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x * right, y: left.y * right)
}

public func *= (left: inout CGPoint, scale:CGFloat) {
    left.x *= scale
    left.y *= scale
}

public func convertToVector(point: CGPoint)-> CGVector {
    return CGVector(dx: point.x, dy: point.y)
}
