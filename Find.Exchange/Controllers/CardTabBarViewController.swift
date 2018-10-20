//
//  CardTabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Lottie

class CardTabBarViewController : UIViewController
{
    var loadingAnimationView : LOTAnimationView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(r: 35, g: 35, b: 35)
        
        loadingAnimationView = LOTAnimationView(name: "loading")
        
        loadingAnimationView?.loopAnimation = true
        loadingAnimationView?.play()
        
        view.addSubview(loadingAnimationView!)
        
        loadingAnimationView?.anchorCenterXToSuperview()
        loadingAnimationView?.anchorCenterYToSuperview()
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.init(r: 35, g: 35, b: 35)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}
