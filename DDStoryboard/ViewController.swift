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
import ReplayKit

class ViewController: UIViewController {
    
    var isRecording = false

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
        
        let recordButton = UIButton();
        self.view.addSubview(recordButton)
        recordButton.backgroundColor = UIColor.red
        recordButton.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(40)
            make.bottom.equalTo(self.view)
        }
        recordButton.addTarget(self, action: #selector(recordButtonClick(sender:)), for: UIControlEvents.touchUpInside)
        
    }
    
    func recordButtonClick(sender:Any) {
        print("录制按钮点击")
        
        if isRecording {
            
            RPScreenRecorder.shared().stopRecording { (preViewController, nil) in
                self.isRecording = false
                print("结束成功")
                self.present(preViewController!, animated: true, completion: { 
                    
                });
            }
        } else {
            
            RPScreenRecorder.shared().startRecording { (nil) in
                self.isRecording = true
                print("开始成功")
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

