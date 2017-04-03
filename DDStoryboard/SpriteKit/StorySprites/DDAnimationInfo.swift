//
//  DDAnimationInfo.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/30.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit

class DDAnimationInfo: NSObject {

    var name:String = ""
    var images:[UIImage] = []
    var frameInterval:Float = 0.0
    var loopCount = 0
    
    
    init(name:String, images:[UIImage], loopCount:Int, frameInterval:Float) {
        self.name = name
        self.images = images
        self.frameInterval = frameInterval
        self.loopCount = loopCount
    }
}
