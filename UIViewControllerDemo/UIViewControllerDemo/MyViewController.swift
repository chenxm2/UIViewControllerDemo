//
//  MyViewController.swift
//  UIViewControllerDemo
//
//  Created by xianmingchen on 16/8/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

import Foundation
import UIKit
class MyViewController: UIViewController {
    private var myView: UIView = UIView(frame: CGRectMake(100, 100, 100, 100));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1);
        myView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(myView)
                
    }
    @IBAction func buttonClicked(sender: AnyObject) {
     myView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
     self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        
//        NSLog("fatherAnchor: %@", NSStringFromCGPoint(self.view.layer.anchorPoint))
//        
//        
//        
//        NSLog("frame: %@", NSStringFromCGRect(myView.frame))
//        NSLog("viewCenter: %@", NSStringFromCGPoint(myView.center))
//        NSLog("layerPosition：% @", NSStringFromCGPoint(myView.layer.position))
//        NSLog("layerAnchor %@" , NSStringFromCGPoint(myView.layer.anchorPoint))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        myView.layer.anchorPoint = CGPointMake(0, 0)
        
//        self.view.layer.anchorPoint = CGPointMake(0, 0);
//        NSLog("fatherAnchor2: %@", NSStringFromCGPoint(self.view.layer.anchorPoint))
//
        
//        NSLog("frame: %@", NSStringFromCGRect(myView.frame))
//        NSLog("viewCenter: %@", NSStringFromCGPoint(myView.center))
//        NSLog("layerPosition：% @", NSStringFromCGPoint(myView.layer.position))
//        NSLog("layerAnchor %@" , NSStringFromCGPoint(myView.layer.anchorPoint))
        
    }
    
    // MARK: HAHA
    func some() {
//      UIModalPresentationOverFullScreen
    }
    
    private func somePrivate() {
//        UIModalPresentationCustom
    }
    
    static func staticFunc() {
        
    }
}