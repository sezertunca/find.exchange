//
//  ScanQrTabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Lottie

class ScanQrTabBarController : UIViewController
{
    var loadingAnimationView : LOTAnimationView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white //UIColor.init(r: 35, g: 35, b: 35)
        
        loadingAnimationView = LOTAnimationView(name: "geometry")
        
        view.addSubview(loadingAnimationView!)
        
        loadingAnimationView?.loopAnimation = true
        loadingAnimationView?.play()
        
        loadingAnimationView?.anchorCenterXToSuperview()
        loadingAnimationView?.anchorCenterYToSuperview()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}
