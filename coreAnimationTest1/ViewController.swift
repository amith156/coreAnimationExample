//
//  ViewController.swift
//  coreAnimationTest1
//
//  Created by Amith Kumar Narayan on 21/12/2019.
//  Copyright © 2019 Narayan inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    let tracLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let center = view.center
        
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2 , endAngle: 2 * CGFloat.pi, clockwise: true)
        tracLayer.path = circularPath.cgPath
        
        tracLayer.fillColor = UIColor.clear.cgColor
        tracLayer.strokeColor = UIColor(red: 230/255, green: 221/255, blue: 221/255, alpha: 1.0).cgColor
        tracLayer.lineWidth = 10
        tracLayer.lineCap = .round
        
        shapeLayer.strokeEnd = 0
        

        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.systemPink.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(tracLayer)
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(screenTap)))
    }

    @objc func screenTap() {
        print("tapping")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.byValue  = 1
        basicAnimation.duration = 3
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "")
        print("end taping")
    }

}

