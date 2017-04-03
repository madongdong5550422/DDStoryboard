//
//  ViewController.swift
//  DDStoryboard
//
//  Created by 1 1 on 2017/3/28.
//  Copyright © 2017年 1 1. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Configure the view.
        let gameView = SKView()
        self.view.addSubview(gameView)
        gameView.backgroundColor = UIColor.gray
        gameView.snp.makeConstraints { (make) in
            make.size.equalTo(self.view)
        }
        
        gameView.showsFPS = true
        gameView.showsNodeCount = true
        gameView.showsFields = true
        gameView.ignoresSiblingOrder = true
        
        // Create and configure the scene.
        let scene = StoryboardScene(size: self.view.frame.size)
        scene.scaleMode = .aspectFill
        
        // Present the scene.
        gameView.presentScene(scene)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

