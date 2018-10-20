//
//  MoreTabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Lottie

class MoreTabBarViewController : UIViewController
{
    var loadingAnimationView : LOTAnimationView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        loadingAnimationView = LOTAnimationView(name: "plane")
        
        loadingAnimationView?.loopAnimation = true
        loadingAnimationView?.play()
        
        view.addSubview(loadingAnimationView!)
        
//        loadingAnimationView?.anchor(top: nil, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 700, height: 300)
        
        loadingAnimationView?.anchorCenterXToSuperview()
        loadingAnimationView?.anchorCenterYToSuperview()
        
        navigationController?.navigationBar.isHidden = false
    }

}
