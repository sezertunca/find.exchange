//
//  AccountsTabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Lottie

class AccountsTabBarViewController : UIViewController
{
    var loadingAnimationView : LOTAnimationView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white //AppGeneralTheme.viewControllerBackgroundColor
        
        loadingAnimationView = LOTAnimationView(name: "logo")
        
        view.addSubview(loadingAnimationView!)
        
        loadingAnimationView?.loopAnimation = true
        loadingAnimationView?.play()
        
        loadingAnimationView?.anchorCenterXToSuperview()
        loadingAnimationView?.anchorCenterYToSuperview()
        
        navigationController?.navigationBar.isHidden = false
    }
}
